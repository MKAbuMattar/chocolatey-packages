<#
    .Synopsis
        Pins each nuspec's iconUrl to the commit that last changed that icon, so an
        approved package's icon cannot change underneath it.

    .Description
        A Chocolatey reviewer asked for the jsDelivr URL to reference a tag or commit
        rather than @main, because @main lets the image shift after a version is
        approved. A moving tag would have the same problem, so each package pins to the
        commit that last touched its own icon. That commit always contains the icon, it
        only changes when the icon does, and the URL is immutable.

        update_all.ps1 runs this before AU, so a package added later gets pinned on the
        next run instead of relying on anyone remembering.

    .Example
        .\pin_icons.ps1
        # Pin every package.

    .Example
        .\pin_icons.ps1 -Check
        # Report packages still on @main or pinned to a commit that is not in history.
        # Changes nothing, exits 1 when any is wrong. Used by CI.
#>
[CmdletBinding()]
param(
    # Packages to pin. Defaults to all of them.
    [string[]]$Name,

    # Report problems and exit non-zero instead of writing.
    [switch]$Check
)

$ErrorActionPreference = 'Stop'

$root = Join-Path $PSScriptRoot 'automatic'
$dirs = Get-ChildItem $root -Directory
if ($Name) { $dirs = $dirs | Where-Object { $Name -contains $_.Name } }

$repoPath = 'MKAbuMattar/chocolatey-packages'
$changed = @()
$problems = @()

foreach ($dir in $dirs) {
    $id = $dir.Name
    $nuspec = Join-Path $dir.FullName "$id.nuspec"
    $icon = Join-Path $PSScriptRoot "icons/$id.png"

    if (!(Test-Path $nuspec)) { continue }
    if (!(Test-Path $icon)) { $problems += "$id has no icons/$id.png"; continue }

    # The commit that last changed this icon is the newest commit guaranteed to contain
    # the current bytes. Anything newer would pin to content that has not changed anyway.
    $sha = (git log -1 --format=%H -- "icons/$id.png") 2>$null
    if (!$sha) { $problems += "$id icon has no commit yet"; continue }
    $sha = $sha.Trim()

    $text = Get-Content $nuspec -Raw
    $wanted = "https://cdn.jsdelivr.net/gh/$repoPath@$sha/icons/$id.png"
    $current = [regex]::Match($text, '<iconUrl>(.*?)</iconUrl>').Groups[1].Value

    if ($current -eq $wanted) { continue }

    if ($Check) {
        if ($current -match '@main/') { $problems += "$id is still pinned to @main" }
        else { $problems += "$id is pinned to a stale commit" }
        continue
    }

    $updated = [regex]::Replace(
        $text, '<iconUrl>.*?</iconUrl>',
        { "<iconUrl>$wanted</iconUrl>" }, 1)
    Set-Content $nuspec $updated -NoNewline -Encoding UTF8
    $changed += $id
}

if ($Check) {
    if ($problems) {
        Write-Host "::error::$($problems.Count) icon URL problem(s):"
        $problems | ForEach-Object { Write-Host "  $_" }
        exit 1
    }
    Write-Host "All icon URLs are pinned to the commit that last changed the icon."
    return
}

if ($problems) { $problems | ForEach-Object { Write-Warning $_ } }
if ($changed) { Write-Host "Pinned $($changed.Count) icon URL(s): $($changed -join ', ')" }
else { Write-Host 'All icon URLs were already pinned.' }
