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

# Every SHA here comes from `git log` over the icon's history, so the repository has to
# be a full clone. Ask git once and say what is wrong, rather than letting each lookup
# fail and reporting all 119 packages as stale.
function Get-GitState {
    # git writes to stderr and exits non-zero outside a repository, which a Stop
    # preference turns into a terminating error, so ask with errors relaxed.
    $old = $ErrorActionPreference
    $ErrorActionPreference = 'Continue'
    try {
        $inside = (& git -C $PSScriptRoot rev-parse --is-inside-work-tree 2>$null | Select-Object -First 1)
        if ($inside -ne 'true') { return 'none' }
        $shallow = (& git -C $PSScriptRoot rev-parse --is-shallow-repository 2>$null | Select-Object -First 1)
        if ($shallow -eq 'true') { return 'shallow' }
        return 'full'
    }
    catch { return 'none' }
    finally { $ErrorActionPreference = $old; $global:LASTEXITCODE = 0 }
}

switch (Get-GitState) {
    'shallow' {
        Write-Host '::error::This repository is a shallow clone, so the commit that last changed each icon cannot be determined. Check out with fetch-depth: 0.'
        exit 1
    }
    'none' {
        # A test fixture copies these scripts into a bare directory. Refusing to pin is
        # correct there; failing the run that calls it is not.
        if ($Check) {
            Write-Host '::error::Not a git repository, so pinned icon URLs cannot be verified.'
            exit 1
        }
        Write-Warning 'Not a git repository, so icon URLs cannot be pinned. Skipping.'
        return
    }
}

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
    # -C keeps git on this repository: without it the lookup follows the caller's working
    # directory, which silently compared these nuspecs against another repo's history.
    $sha = (git -C $PSScriptRoot log -1 --format=%H -- "icons/$id.png") 2>$null
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
