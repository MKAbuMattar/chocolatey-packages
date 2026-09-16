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

# A pull request that deletes a package still lists it in the diff, so the caller can
# hand us a name with no directory behind it. There is nothing to install, and throwing
# on it makes a removal-only pull request unmergeable.
$gone = @($Name | Where-Object { !(Test-Path (Join-Path $PSScriptRoot "automatic\$_")) })
if ($gone) {
    Write-Host "Skipping removed package(s): $($gone -join ', ')"
    $Name = @($Name | Where-Object { Test-Path (Join-Path $PSScriptRoot "automatic\$_") })
}
if (!$Name) {
    Write-Host 'Nothing left to test'
    return
}

if (!$NoPack) {
    & "$PSScriptRoot\update_all.ps1" -Name $Name -Force
}

$failed = @()
foreach ($pkg in $Name) {
    $dir = Join-Path $PSScriptRoot "automatic\$pkg"
    $nupkg = Get-ChildItem $dir -Filter *.nupkg -ErrorAction SilentlyContinue | Select-Object -First 1
    if (!$nupkg) {
        Write-Host "::error::$pkg packed no nupkg"
        $failed += $pkg
        continue
    }

    Write-Host "`n=== $pkg : install ===" -ForegroundColor Cyan
    # --pre or choco cannot see a prerelease version at all, and reports the package
    # as not found rather than as skipped. buzz, llrt and octobot all ship prereleases.
    choco install $pkg --source $dir --yes --no-progress --limit-output --verbosity=error --pre
    $installExit = $LASTEXITCODE

    if ($installExit -ne 0) {
        Write-Host "::error::$pkg failed to install (exit $installExit)"
        $failed += $pkg
        # nothing to uninstall, and the next package must still run
        continue
    }

    # A package can install cleanly and still ship nothing runnable: colibri shimmed
    # eight engines and not its launcher, and choco exited 0 throughout (#33). Take the
    # entry points the package names for itself and prove each one landed, so the
    # expectation cannot drift from the install script.
    $binRoot = Join-Path $Env:ChocolateyInstall 'bin'
    $script = Join-Path $dir 'tools\chocolateyInstall.ps1'
    $declared = @()
    if (Test-Path $script) {
        $declared = @([regex]::Matches((Get-Content $script -Raw), "Install-BinFile\s+-Name\s+'([^']+)'") |
            ForEach-Object { $_.Groups[1].Value })
    }
    $missing = @($declared | Where-Object { !(Get-ChildItem $binRoot -Filter "$_.*" -ErrorAction Ignore) })
    if ($missing) {
        Write-Host "::error::$pkg installed but no shim was created for: $($missing -join ', ')"
        $failed += $pkg
    }
    elseif ($declared) {
        Write-Host "$pkg shimmed: $($declared -join ', ')"
    }

    Write-Host "`n=== $pkg : uninstall ===" -ForegroundColor Cyan
    choco uninstall $pkg --yes --no-progress --limit-output --verbosity=error
    if ($LASTEXITCODE -ne 0) {
        Write-Host "::error::$pkg installed but failed to uninstall (exit $LASTEXITCODE)"
        $failed += $pkg
    }
    else {
        # A shim left behind keeps answering for a package that is gone, so the
        # uninstall script has to remove what the install script added.
        $orphan = @($declared | Where-Object { Get-ChildItem $binRoot -Filter "$_.*" -ErrorAction Ignore })
        if ($orphan) {
            Write-Host "::error::$pkg uninstalled but left shims behind: $($orphan -join ', ')"
            $failed += $pkg
        }
        else {
            Write-Host "$pkg installed and uninstalled cleanly"
        }
    }
}

if ($failed) {
    Write-Host "::error::install test failed for: $($failed -join ', ')"
    exit 1
}
Write-Host "`nAll install tests passed"
