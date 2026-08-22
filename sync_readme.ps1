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

    .Notes
        A package this script cannot sync - no README.md, no CDATA <description>, a ']]>'
        in the README - is a failure, not a warning. Warnings scroll past in a workflow
        log and the package page keeps whatever description it had, so the script exits 1
        for those too, in either mode.
#>
[CmdletBinding()]
param(
    # Packages to sync. Defaults to all of them.
    [string[]]$Name,

    # Report drift and exit non-zero instead of writing. Nothing is modified.
    [switch]$Check
)

$ErrorActionPreference = 'Stop'

$root = Join-Path $PSScriptRoot 'automatic'
$dirs = Get-ChildItem $root -Directory
if ($Name) {
    # A misspelled name used to sync nothing and still report success.
    $unknown = @($Name | Where-Object { $_ -notin $dirs.Name })
    if ($unknown) {
        Write-Host "::error::not a package in automatic/: $($unknown -join ', ')"
        exit 1
    }
    $dirs = $dirs | Where-Object { $Name -contains $_.Name }
}

$changed = @()
$broken  = @()

foreach ($dir in $dirs) {
    $id      = $dir.Name
    $readme  = Join-Path $dir.FullName 'README.md'
    $nuspec  = Join-Path $dir.FullName "$id.nuspec"

    if (!(Test-Path $readme) -or !(Test-Path $nuspec)) {
        Write-Host "::error::$id is missing README.md or $id.nuspec"
        $broken += $id
        continue
    }

    $current = Get-Content $nuspec -Raw

    # Match the nuspec's own line ending. Git hands CI a CRLF checkout and a developer
    # on Linux an LF one, so a hard coded ending would report drift on every run.
    $nl = if ($current -match "`r`n") { "`r`n" } else { "`n" }

    # Drop the H1. It titles the file in this repository, not the package page.
    $body = (Get-Content $readme -Raw) -replace '^\s*#\s+[^\r\n]*\r?\n\s*', ''
    $body = ($body.TrimEnd() -replace "`r`n", "`n") -replace "`n", $nl

    if ($body -match '\]\]>') {
        Write-Host "::error::$id README contains ']]>' which cannot go in a CDATA block"
        $broken += $id
        continue
    }

    $pattern = '(?s)<description><!\[CDATA\[.*?\]\]></description>'

    if ($current -notmatch $pattern) {
        Write-Host "::error::$id nuspec has no CDATA <description> to write into"
        $broken += $id
        continue
    }

    # The body starts right after 'CDATA[' with no newline of its own. AU rewrites the
    # nuspec through XmlDocument when it bumps the version, and that drops a newline in
    # that position, so writing one here left every package out of sync again after its
    # next update and failed -Check on the next pull request.
    # A literal replacement, so '$' and '\' in the README are not treated as substitutions.
    $updated = [regex]::Replace(
        $current, $pattern,
        { "<description><![CDATA[$body$nl]]></description>" },
        1)

    if ($updated -ne $current) {
        $changed += $id
        if (!$Check) { Set-Content $nuspec $updated -NoNewline -Encoding UTF8 }
    }
}

if ($Check -and $changed) {
    Write-Host "::error::$($changed.Count) nuspec description(s) out of sync with README.md: $($changed -join ', ')"
    Write-Host 'Run .\sync_readme.ps1 and commit the result.'
}
elseif ($changed) { Write-Host "Synced $($changed.Count) nuspec description(s): $($changed -join ', ')" }
else { Write-Host 'All nuspec descriptions match their README.' }

if ($broken) {
    Write-Host "::error::$($broken.Count) package(s) could not be synced: $($broken -join ', ')"
}

if ($broken -or ($Check -and $changed)) { exit 1 }
