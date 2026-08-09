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
        try { .\update.ps1 | Out-Null } catch { Write-Host "Warm-up skipped: $_" }
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

$global:info = updateall -Name $Name -Options $Options

# Update-AUPackages returns the collection of packages, not the run summary, so
# failures have to be counted from the packages themselves. Reading a summary
# property here silently found nothing and let broken runs report success.
$failed = @($global:info | Where-Object { $_.Error -and -not $_.Ignored })
if ($failed) {
    $failed | ForEach-Object { Write-Host "`nPackage: $($_.Name)`n$($_.Error)" }
    Write-Host "::error::$($failed.Count) package(s) failed: $($failed.Name -join ', ')"
    # A bare throw is not enough: with `shell: powershell` an unhandled terminating
    # error still leaves the exit code at 0, so the step would report success while
    # packages were failing. Exit explicitly instead.
    exit 1
}
