<#
    .Synopsis
        Checks every automatic package for a new upstream version, updates the ones
        that have one, packs them and (when $Env:au_Push is 'true') pushes them to the
        Chocolatey community repository.

    .Example
        .\update_all.ps1
        # Update every package in .\automatic that has a new upstream version.

    .Example
        .\update_all.ps1 -Name pixi
        # Only check the pixi package.

    .Example
        .\update_all.ps1 -Force
        # Re-run every updater and pack every package even when there is no new version.
        # Never pushes. This is the smoke test mode used by pull requests.

    .Example
        .\update_all.ps1 -Name witsy -Force
        # Same, for a single package.
#>
[CmdletBinding()]
param(
    # Packages to check. Defaults to all of them.
    [string[]]$Name,

    # Update and pack packages even when there is no new version. Pushes nothing.
    [switch]$Force
)

# Local runs read secrets from update_vars.ps1 (git ignored), CI sets them as env vars.
if (Test-Path $PSScriptRoot/update_vars.ps1) { . $PSScriptRoot/update_vars.ps1 }

$global:au_Root = "$PSScriptRoot\automatic"

# AU matches -Name against folder names and reports nothing for one that does not exist,
# which used to end in a green run that checked no package at all.
if ($Name) {
    $known   = (Get-ChildItem $global:au_Root -Directory).Name
    $unknown = @($Name | Where-Object { $_ -notin $known })
    if ($unknown) {
        Write-Host "::error::not a package in automatic/: $($unknown -join ', ')"
        exit 1
    }
}

# The package page renders the nuspec <description>, but the text is written in the
# package README. Sync before AU packs anything, or the two drift apart silently.
$global:LASTEXITCODE = 0    # so a stale code from an earlier command is not read as failure
try { & "$PSScriptRoot\sync_readme.ps1" -Name $Name }
catch {
    Write-Host "::error::sync_readme.ps1 failed: $_"
    exit 1
}
if ($LASTEXITCODE) {
    Write-Host "::error::sync_readme.ps1 failed with $LASTEXITCODE, so the descriptions AU would pack are unknown"
    exit 1
}

# The first time AU calculates a checksum it copies Chocolatey's helpers into TEMP and
# monkey patches them. Nothing locks that copy, so on a cold cache several threads build
# it at once and trip over each other with "Container cannot be copied onto existing leaf
# item" (chocolatey-au#29). Letting one small package build it first avoids the race.
if (!(Test-Path "$Env:TEMP\chocolatey\au\chocolatey")) {
    Write-Host 'Warming the AU chocolatey copy'
    $warm = "$PSScriptRoot\automatic\tailspin"   # smallest download in the repo
    if (Test-Path $warm) {
        $global:au_WhatIf = $true               # back up and restore, so no files change
        Push-Location $warm
        # Best effort only: the run below reports this package on its own, so a failure
        # here is worth printing but not worth stopping for.
        try { .\update.ps1 | Out-Null } catch { Write-Host "::warning::AU warm-up failed, continuing: $_" }
        finally { Pop-Location; $global:au_WhatIf = $false }
    }
}

$Options = [ordered]@{
    Force         = [bool]$Force
    Timeout       = 100                                     # Web request timeout in seconds
    UpdateTimeout = 1200                                    # Per package timeout in seconds
    Threads       = 6                                       # keep the checksum downloads from saturating the runner
    # -Force rebuilds packages that have no new version, which would publish a
    # pointless fix-notation release, so forcing never pushes. Republish by hand
    # from the package folder instead (see README).
    Push          = ($Env:au_Push -eq 'true') -and (!$Force)
    PushAll       = $true
    RepeatSleep   = 60
    RepeatCount   = 2

    IgnoreOn      = @(                                      # Not our problem - ignore, don't fail the run
        'The operation has timed out'
        'Internal Server Error'
        'package version already exists'
        # The community repository caps how many packages one maintainer can have
        # awaiting moderation. Over that cap a push returns 403 until the queue
        # drains, which is nothing this repository can act on, so let it retry
        # hourly rather than turn every run red.
        '403 (Forbidden)'
    )

    RepeatOn      = @(                                      # Transient - retry
        'Could not create SSL/TLS secure channel'
        'Unable to connect'
        'The operation has timed out'
        'Internal Server Error'
        # The push endpoint returns 409 with this text both when a version really
        # exists and, occasionally, for no lasting reason. Retrying first means a
        # transient conflict no longer silently drops the package; a real one still
        # falls through to IgnoreOn below.
        'package version already exists'
        '409 (Conflict)'
    )

    Report        = @{                                      # Run report, published as the workflow summary
        Type   = 'markdown'
        Path   = "$PSScriptRoot\Update-AUPackages.md"
        Params = @{
            Github_UserRepo = $Env:github_user_repo
            NoAppVeyor      = $true
            Title           = 'Chocolatey package update report'
        }
    }

    Git           = @{                                      # Commit the updated package files back to this repo
        Password       = $Env:github_api_key
        Branch         = 'main'
        commitStrategy = 'atomic'                            # one commit per package
    }

    GitReleases   = @{                                      # GitHub release per updated package, with the nupkg attached
        ApiToken    = $Env:github_api_key
        ReleaseType = 'package'
        Branch      = 'main'
    }
}

# Both keys reach AU as environment variables, so a missing one is only found out package
# by package, halfway through a run that has already spent an hour downloading.
if ($Options.Push -and !$Env:api_key) {
    Write-Host '::error::au_Push is true but api_key is not set, so no package could be pushed'
    exit 1
}
if (!$Env:github_api_key) {
    Write-Host '::warning::github_api_key is not set: the GitHub API calls are rate limited as anonymous, and updated packages cannot be committed or released'
}

# An error out of AU itself - a bad option, a module that will not load - is a failed run
# and has to be turned into an exit code, for the same reason as the failure count below.
try { $global:info = updateall -Name $Name -Options $Options }
catch {
    Write-Host "::error::Update-AUPackages failed: $_"
    exit 1
}

# No results at all means AU never ran a package, which is a failed run and not an
# empty one. Left unchecked the count below is zero and the run reports success.
if (!$global:info) {
    Write-Host '::error::Update-AUPackages returned no packages, so nothing was checked'
    exit 1
}

# Update-AUPackages returns the collection of packages, not the run summary, so
# failures have to be counted from the packages themselves. Reading a summary
# property here silently found nothing and let broken runs report success.
$failed = @($global:info | Where-Object { $_.Error -and -not $_.Ignored })
if ($failed) {
    $failed | ForEach-Object { Write-Host "`nPackage: $($_.Name)`n$($_.Error)" }
    Write-Host "::error::$($failed.Count) package(s) failed: $($failed.Name -join ', ')"
    exit 1
}
