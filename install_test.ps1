<#
    .Synopsis
        Installs and uninstalls packages for real, from the nupkgs AU just packed.

    .Description
        test.yaml only proves a package packs. This script goes one step further and
        runs a genuine `choco install` of the built nupkg followed by a
        `choco uninstall`, which is what actually exercises the install script: its
        silent arguments, its checksum, its shims and the auto-uninstaller's
        softwareName match.

        The community repository's choco-bot does the same thing once a version is
        submitted; this runs it before submission instead, in the pull request.

    .Example
        .\install_test.ps1 -Name traccar, squad
        # Pack, install and uninstall just those two.

    .Notes
        Run update_all.ps1 -Force first, or pass -Force here: the nupkg has to exist
        before choco can install it.
#>
[CmdletBinding()]
param(
    # Packages to test. Defaults to every package in automatic/.
    [string[]]$Name,

    # Pack the packages first with update_all.ps1 -Force. Off when the caller
    # already packed them.
    [switch]$NoPack
)

$ErrorActionPreference = 'Stop'

if (!$Name) {
    $Name = (Get-ChildItem "$PSScriptRoot\automatic" -Directory).Name
    Write-Host "Testing all $($Name.Count) packages"
}

if (!$NoPack) {
    & "$PSScriptRoot\update_all.ps1" -Name $Name -Force
}

$failed = @()
foreach ($pkg in $Name) {
    $dir = Join-Path $PSScriptRoot "automatic\$pkg"
    $nupkg = Get-ChildItem $dir -Filter *.nupkg | Select-Object -First 1
    if (!$nupkg) {
        Write-Host "::error::$pkg packed no nupkg"
        $failed += $pkg
        continue
    }

    Write-Host "`n=== $pkg : install ===" -ForegroundColor Cyan
    choco install $pkg --source $dir --yes --no-progress --limit-output --verbosity=error
    $installExit = $LASTEXITCODE

    if ($installExit -ne 0) {
        Write-Host "::error::$pkg failed to install (exit $installExit)"
        $failed += $pkg
        # nothing to uninstall, and the next package must still run
        continue
    }

    Write-Host "`n=== $pkg : uninstall ===" -ForegroundColor Cyan
    choco uninstall $pkg --yes --no-progress --limit-output --verbosity=error
    if ($LASTEXITCODE -ne 0) {
        Write-Host "::error::$pkg installed but failed to uninstall (exit $LASTEXITCODE)"
        $failed += $pkg
    }
    else {
        Write-Host "$pkg installed and uninstalled cleanly"
    }
}

if ($failed) {
    Write-Host "::error::install test failed for: $($failed -join ', ')"
    exit 1
}
Write-Host "`nAll install tests passed"
