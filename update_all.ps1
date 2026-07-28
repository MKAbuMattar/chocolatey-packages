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
        # Never pushes - this is the smoke test mode used by pull requests.

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

$Options = [ordered]@{
    Force         = [bool]$Force
    Timeout       = 100                                     # Web request timeout in seconds
    UpdateTimeout = 1200                                    # Per package timeout in seconds
    Threads       = 10
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
    )

    RepeatOn      = @(                                      # Transient - retry
        'Could not create SSL/TLS secure channel'
        'Unable to connect'
        'The operation has timed out'
        'Internal Server Error'
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

$global:au_Root = "$PSScriptRoot\automatic"
$global:info = updateall -Name $Name -Options $Options

if ($global:info.error_count.total) {
    throw "$($global:info.error_count.total) package(s) failed, see the report for details"
}
