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

    $current = Get-Content $nuspec -Raw

    # Match the nuspec's own line ending. Git hands CI a CRLF checkout and a developer
    # on Linux an LF one, so a hard coded ending would report drift on every run.
    $nl = if ($current -match "`r`n") { "`r`n" } else { "`n" }

    # Drop the H1. It titles the file in this repository, not the package page.
    $body = (Get-Content $readme -Raw) -replace '^\s*#\s+[^\r\n]*\r?\n\s*', ''
    $body = ($body.TrimEnd() -replace "`r`n", "`n") -replace "`n", $nl

    if ($body -match '\]\]>') {
        Write-Warning "$id README contains ']]>' which cannot go in a CDATA block, skipped"
        continue
    }

    $pattern = '(?s)<description><!\[CDATA\[(.*?)\]\]></description>'
    $match = [regex]::Match($current, $pattern)

    if (!$match.Success) {
        Write-Warning "$id nuspec has no CDATA <description>, skipped"
        continue
    }

    # Compare what the description says, not how it is laid out. AU rewrites the nuspec
    # when it bumps a version and drops the newline after <![CDATA[, so a byte comparison
    # reported all 10 packages it had touched as out of sync and would have failed the
    # next pull request over a change nobody made.
    $existing = ($match.Groups[1].Value -replace "`r`n", "`n").Trim()
    $wanted   = ($body -replace "`r`n", "`n").Trim()
    if ($existing -eq $wanted) { continue }

    # Write the shape AU leaves behind, so a later version bump is not also a
    # formatting change. A literal replacement, so '$' and '\' in the README are not
    # treated as substitutions.
    $updated = [regex]::Replace(
        $current, $pattern,
        { "<description><![CDATA[$body$nl]]></description>" },
        1)

    if ($updated -ne $current) {
        $changed += $id
        if (!$Check) {
            # Write back with the BOM state the file came in with. 'UTF8' in
            # Set-Content means with-BOM on Windows PowerShell 5.1 and without on
            # pwsh, so the encoding enum would flip the file's BOM depending on
            # which shell ran the sync.
            $raw = [IO.File]::ReadAllBytes($nuspec)
            $utf8 = [Text.UTF8Encoding]::new(
                $raw.Length -ge 3 -and
                $raw[0] -eq 0xEF -and $raw[1] -eq 0xBB -and $raw[2] -eq 0xBF
            )
            [IO.File]::WriteAllText($nuspec, $updated, $utf8)
        }
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
