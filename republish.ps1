<#
    .Synopsis
        Packs named packages exactly as they stand and pushes them to the Chocolatey
        Community Repository, without touching the version.

    .Description
        update_all.ps1 only pushes when upstream ships a new version, so it cannot help
        with a version that is already published and sitting in moderation. When a
        reviewer rejects a package, Chocolatey asks for the same version number to be
        uploaded again with the fix, and that is what this script does.

        It never calls update.ps1, so no version is bumped, no URL is re-resolved and no
        checksum is recalculated. What is committed is what gets pushed.

    .Example
        .\republish.ps1 -Name pkl,daytona -WhatIf
        # Pack both and report what would be pushed. Pushes nothing.

    .Example
        .\republish.ps1 -Name pkl
        # Pack pkl and push it. Needs $Env:api_key.
#>
[CmdletBinding()]
param(
    # Packages to repack and push. Required, because pushing everything is never wanted.
    [Parameter(Mandatory)]
    [string[]]$Name,

    # Pack and report, push nothing.
    [switch]$WhatIf
)

# Local runs read secrets from update_vars.ps1 (git ignored), CI sets them as env vars.
if (Test-Path $PSScriptRoot/update_vars.ps1) { . $PSScriptRoot/update_vars.ps1 }

$ErrorActionPreference = 'Stop'

# Windows PowerShell 5.1, which is what `shell: powershell` gives the runner, does not
# load this by default. PowerShell 7 already has it and loading twice is harmless.
Add-Type -AssemblyName System.IO.Compression.FileSystem

$root = Join-Path $PSScriptRoot 'automatic'
$out  = Join-Path $PSScriptRoot '.republish'
if (Test-Path $out) { Remove-Item $out -Recurse -Force }
New-Item $out -ItemType Directory | Out-Null

if (!$WhatIf -and !$Env:api_key) {
    throw 'api_key is not set. Set it in update_vars.ps1 locally, or as the CHOCO_API_KEY secret in CI.'
}

$failed = @()
$pushed = @()

foreach ($id in $Name) {
    $dir = Join-Path $root $id
    if (!(Test-Path $dir)) { Write-Host "::error::$id is not a package in automatic/"; $failed += $id; continue }

    $nuspec  = Join-Path $dir "$id.nuspec"
    $version = ([xml](Get-Content $nuspec -Raw)).package.metadata.version

    Write-Host "`n=== $id $version ==="

    Push-Location $dir
    try {
        choco pack --outputdirectory $out
        if ($LASTEXITCODE -ne 0) { throw "choco pack failed with $LASTEXITCODE" }
    }
    catch { Write-Host "::error::$id pack failed: $_"; $failed += $id; Pop-Location; continue }
    Pop-Location

    $nupkg = Join-Path $out "$id.$version.nupkg"
    if (!(Test-Path $nupkg)) { Write-Host "::error::$id packed but $nupkg is missing"; $failed += $id; continue }

    # Files that would fail moderation are caught by an allowlist, not a banned
    # extension list: banned lists keep growing (.exe, .msi, .zip, .7z, .dll, .msix,
    # .appx, .tar.gz, ...) and a miss costs a moderation round. What a package here may
    # ship is fixed anyway - its nuspec, PowerShell scripts in tools\, and the legal
    # files Chocolatey auto-includes. $plumbing is the package metadata choco pack
    # (NuGet packaging) writes into every nupkg it builds - metadata, not content.
    $plumbing =
        '^(\[Content_Types\]\.xml|_rels/\.rels|package/services/metadata/core-properties/[^/]+\.psmdcp)$'
    $zip = [IO.Compression.ZipFile]::OpenRead($nupkg)
    try {
        $bad = @($zip.Entries | Where-Object {
            -not $_.FullName.EndsWith('/') -and
            $_.FullName -ne "$id.nuspec" -and
            $_.FullName -notmatch $plumbing -and
            $_.FullName -notmatch '^tools/[^/]+\.(ps1|psm1|txt)$' -and
            $_.FullName -notmatch '^(tools/)?(license|verification|legal)(\.txt|\.md)?$'
        } | Select-Object -ExpandProperty FullName)
    }
    finally { $zip.Dispose() }
    if ($bad) {
        Write-Host "::error::$id carries files that are not install scripts or legal files and would fail validation: $($bad -join ', ')"
        $failed += $id
        continue
    }

    $size = '{0:N0}' -f (Get-Item $nupkg).Length
    Write-Host "packed clean, $size bytes"

    if ($WhatIf) { Write-Host "WhatIf: would push $id $version"; continue }

    choco push $nupkg --source https://push.chocolatey.org/ --api-key $Env:api_key --force
    if ($LASTEXITCODE -ne 0) { Write-Host "::error::$id push failed with $LASTEXITCODE"; $failed += $id; continue }

    $pushed += "$id $version"
}

Write-Host "`n================ summary ================"
if ($pushed) { Write-Host "pushed:  $($pushed -join ', ')" }
if ($failed) {
    Write-Host "::error::failed: $($failed -join ', ')"
    exit 1
}
Write-Host 'no failures'
