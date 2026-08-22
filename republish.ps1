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

$ErrorActionPreference = 'Stop'

# Windows PowerShell 5.1, which is what `shell: powershell` gives the runner, does not
# load this by default. PowerShell 7 already has it and loading twice is harmless.
Add-Type -AssemblyName System.IO.Compression.FileSystem

$root = Join-Path $PSScriptRoot 'automatic'
$out  = Join-Path $PSScriptRoot '.republish'
if (Test-Path $out) { Remove-Item $out -Recurse -Force }
New-Item $out -ItemType Directory | Out-Null

if (!$WhatIf -and !$Env:api_key) {
    Write-Host '::error::api_key is not set. Set it in update_vars.ps1 locally, or as the CHOCO_API_KEY secret in CI.'
    exit 1
}

$failed = @()
$pushed = @()

foreach ($id in $Name) {
    # One package that cannot be read or packed must not take the rest of the list, and
    # the run has to reach the summary below, so nothing in here is left to escape.
    try {
        $dir = Join-Path $root $id
        if (!(Test-Path $dir)) { throw "not a package in automatic/" }

        $nuspec = Join-Path $dir "$id.nuspec"
        if (!(Test-Path $nuspec)) { throw "$id.nuspec is missing" }

        $version = ([xml](Get-Content $nuspec -Raw)).package.metadata.version
        if (!$version) { throw "$id.nuspec records no version" }

        Write-Host "`n=== $id $version ==="

        Push-Location $dir
        try {
            choco pack --outputdirectory $out
            if ($LASTEXITCODE -ne 0) { throw "choco pack failed with $LASTEXITCODE" }
        }
        finally { Pop-Location }

        $nupkg = Join-Path $out "$id.$version.nupkg"
        if (!(Test-Path $nupkg)) { throw "packed but $nupkg is missing" }

        # The binaries-in-the-package failure was invisible until someone opened a nupkg.
        # Refuse to push one rather than spend another moderation round finding out.
        $zip = [IO.Compression.ZipFile]::OpenRead($nupkg)
        try {
            $bad = @($zip.Entries | Where-Object { $_.FullName -match '\.(exe|msi|zip|7z|dll)$' } |
                     Select-Object -ExpandProperty FullName)
        }
        finally { $zip.Dispose() }
        if ($bad) { throw "carries binaries and would fail validation: $($bad -join ', ')" }

        $size = '{0:N0}' -f (Get-Item $nupkg).Length
        Write-Host "packed clean, $size bytes"

        if ($WhatIf) { Write-Host "WhatIf: would push $id $version"; continue }

        choco push $nupkg --source https://push.chocolatey.org/ --api-key $Env:api_key --force
        if ($LASTEXITCODE -ne 0) { throw "push failed with $LASTEXITCODE" }

        $pushed += "$id $version"
    }
    catch {
        Write-Host "::error::$id`: $_"
        $failed += $id
    }
}

Write-Host "`n================ summary ================"
if ($pushed) { Write-Host "pushed:  $($pushed -join ', ')" }
if ($failed) {
    Write-Host "::error::failed: $($failed -join ', ')"
    exit 1
}
if (!$WhatIf -and !$pushed) {
    Write-Host '::error::nothing was pushed'
    exit 1
}
Write-Host 'no failures'
