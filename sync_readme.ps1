<#
    .Synopsis
        Copies each package's README.md into the <description> of its nuspec, so the
        README is the one place the package description is written.

    .Description
        The Chocolatey package page renders <description>. Keeping a second copy of the
        text there by hand meant the two drifted apart. This script rewrites the CDATA
        block from README.md, minus the leading '# <name> Chocolatey Package' heading,
        which is a repository-only title and does not belong on the package page.

        update_all.ps1 runs this before AU so every packed nuspec matches its README.

    .Example
        .\sync_readme.ps1
        # Sync every package.

    .Example
        .\sync_readme.ps1 -Name pixi
        # Only pixi.

    .Example
        .\sync_readme.ps1 -Check
        # Report packages that are out of sync and exit 1. Changes nothing. Used by CI.
#>
[CmdletBinding()]
param(
    # Packages to sync. Defaults to all of them.
    [string[]]$Name,

    # Report drift and exit non-zero instead of writing. Nothing is modified.
    [switch]$Check
)

$root = Join-Path $PSScriptRoot 'automatic'
$dirs = Get-ChildItem $root -Directory
if ($Name) { $dirs = $dirs | Where-Object { $Name -contains $_.Name } }

$changed = @()

foreach ($dir in $dirs) {
    $id      = $dir.Name
    $readme  = Join-Path $dir.FullName 'README.md'
    $nuspec  = Join-Path $dir.FullName "$id.nuspec"

    if (!(Test-Path $readme) -or !(Test-Path $nuspec)) {
        Write-Warning "$id is missing README.md or $id.nuspec, skipped"
        continue
    }

    # Drop the H1. It titles the file in this repository, not the package page.
    $body = (Get-Content $readme -Raw) -replace '^\s*#\s+[^\r\n]*\r?\n\s*', ''
    $body = $body.TrimEnd() -replace "`r`n", "`n"

    if ($body -match '\]\]>') {
        Write-Warning "$id README contains ']]>' which cannot go in a CDATA block, skipped"
        continue
    }

    $current = Get-Content $nuspec -Raw
    $pattern = '(?s)<description><!\[CDATA\[.*?\]\]></description>'

    if ($current -notmatch $pattern) {
        Write-Warning "$id nuspec has no CDATA <description>, skipped"
        continue
    }

    # A literal replacement, so '$' and '\' in the README are not treated as substitutions.
    $updated = [regex]::Replace(
        $current, $pattern,
        { "<description><![CDATA[`n$body`n]]></description>" },
        1)

    if ($updated -ne $current) {
        $changed += $id
        if (!$Check) { Set-Content $nuspec $updated -NoNewline -Encoding UTF8 }
    }
}

if ($Check) {
    if ($changed) {
        Write-Host "::error::$($changed.Count) nuspec description(s) out of sync with README.md: $($changed -join ', ')"
        Write-Host 'Run .\sync_readme.ps1 and commit the result.'
        exit 1
    }
    Write-Host 'All nuspec descriptions match their README.'
    return
}

if ($changed) { Write-Host "Synced $($changed.Count) nuspec description(s): $($changed -join ', ')" }
else { Write-Host 'All nuspec descriptions already match their README.' }
