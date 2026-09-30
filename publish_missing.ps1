<#
    .Synopsis
        Pushes every package whose current version has never reached the Chocolatey
        community repository.

    .Description
        update_all.ps1 only pushes a package when upstream has a newer version than the
        nuspec. A package added at upstream's latest version therefore never publishes
        until upstream releases again; oh-my-pi and kytyps5 sat unpublished after their
        pull request merged for exactly that reason.

        This fills the gap: for each package it asks the gallery whether the nuspec's
        version exists, and republishes the ones that do not. It asks the package page,
        not the OData API, because the API answers 404 for a version moderation rejected
        as well as for one that never existed, and a rejected version keeps its number
        reserved, so pushing it again only returns 409. The page returns 404 only when
        the version has never been pushed.

        Packing and pushing go through republish.ps1, so the same binary guard applies.

    .Example
        .\publish_missing.ps1
        # Push every package whose current version is not on the gallery.

    .Example
        .\publish_missing.ps1 -WhatIf
        # Report which packages would be pushed, and pack them, without pushing.
#>
[CmdletBinding()]
param(
    # Packages to consider. Defaults to all of them.
    [string[]]$Name,

    # Pack and report, push nothing.
    [switch]$WhatIf
)

function ConvertTo-NuGetVersion {
    <#
        .Synopsis
            The version as the gallery stores it.

        .Description
            NuGet normalises versions on push: it pads to three parts and drops a fourth
            part that is zero, so a nuspec reading 0.8-b1 is published as 0.8.0-b1. The
            package page only answers at the normalised form, so asking for the raw one
            would report a published package as missing.
    #>
    param([Parameter(Mandatory)][string]$Version)

    $core, $pre = $Version -split '-', 2
    $parts = @($core -split '\.' | ForEach-Object { [string][long]$_ })
    while ($parts.Count -lt 3) { $parts += '0' }
    if ($parts.Count -eq 4 -and $parts[3] -eq '0') { $parts = $parts[0..2] }
    $normal = $parts -join '.'
    if ($pre) { $normal += "-$pre" }
    $normal
}

function Test-GalleryVersion {
    <#
        .Synopsis
            $true if the version exists on the gallery in any state, $false if it has
            never been pushed, $null if the gallery could not be asked.
    #>
    param(
        [Parameter(Mandatory)][string]$Id,
        [Parameter(Mandatory)][string]$Version
    )

    # Each source is blind to one state, so a version is missing only when both say so.
    # The OData API answers 404 for a rejected version, whose number stays reserved.
    # The package page answers 404 for a first version the gallery has not processed
    # yet: kytyps5 had no page for an hour after its push while the API already
    # reported it Submitted.
    $normal = ConvertTo-NuGetVersion $Version
    $sources = @(
        "https://community.chocolatey.org/api/v2/Packages(Id='$Id',Version='$normal')"
        "https://community.chocolatey.org/packages/$Id/$normal"
    )
    foreach ($url in $sources) {
        $found = $null
        for ($attempt = 1; $attempt -le 3 -and $null -eq $found; $attempt++) {
            try {
                Invoke-WebRequest $url -UseBasicParsing -TimeoutSec 60 | Out-Null
                $found = $true
            }
            catch {
                if ($_.Exception.Response.StatusCode.value__ -eq 404) { $found = $false }
                else { Start-Sleep -Seconds (5 * $attempt) }
            }
        }
        if ($found) { return $true }
        # Could not ask this source at all: not knowing is not the same as missing.
        if ($null -eq $found) { return $null }
    }
    $false
}

function Get-PushOutcome {
    <#
        .Synopsis
            What a failed push means, from the text choco printed.

        .Description
            A 403 is the cap on how many packages one maintainer may have awaiting
            moderation, which clears on its own as the queue drains. A 409 means the
            number is taken, which for a version the page did not know means moderation
            rejected it and the package needs a new version. Neither is something the
            next run can fix by failing, so both are reported, not treated as errors.
    #>
    param([string]$Output)

    if ($Output -match '403|Forbidden') { return 'queue-cap' }
    if ($Output -match '409|Conflict|already exists') { return 'reserved' }
    'failed'
}

# Dot-sourcing loads the functions for the tests without running anything.
if ($MyInvocation.InvocationName -eq '.') { return }

$ErrorActionPreference = 'Stop'

$dirs = Get-ChildItem (Join-Path $PSScriptRoot 'automatic') -Directory
if ($Name) { $dirs = $dirs | Where-Object { $Name -contains $_.Name } }

$missing = @()
$unknown = @()
foreach ($dir in $dirs) {
    $id = $dir.Name
    $nuspec = Join-Path $dir.FullName "$id.nuspec"
    if (!(Test-Path $nuspec)) { continue }
    $version = ([xml](Get-Content $nuspec -Raw)).package.metadata.version

    $state = Test-GalleryVersion -Id $id -Version $version
    if ($null -eq $state) { $unknown += "$id $version" }
    elseif (!$state) { $missing += $id; Write-Host "$id $version is not on the gallery" }
}

if ($unknown) {
    # Not knowing is not a reason to push: a wrong guess spends a moderation slot.
    Write-Warning "Could not ask the gallery about: $($unknown -join ', '). The next run will retry."
}
if (!$missing) {
    Write-Host 'Every package version is already on the gallery.'
    exit 0
}

$republish = Join-Path $PSScriptRoot 'republish.ps1'
$failed = @()
foreach ($id in $missing) {
    # One package per call, so each outcome can be read from its own output.
    $out = & $republish -Name $id -WhatIf:$WhatIf *>&1 | Out-String
    Write-Host $out
    if ($LASTEXITCODE -eq 0) { continue }

    switch (Get-PushOutcome $out) {
        'queue-cap' { Write-Warning "$id hit the moderation queue cap (403); the next run will retry." }
        'reserved' { Write-Warning "$id's version is taken on the gallery (409), most likely rejected; it needs a new version." }
        default { $failed += $id }
    }
}

if ($failed) {
    Write-Host "::error::could not publish: $($failed -join ', ')"
    exit 1
}

# Say so explicitly. The runner's PowerShell wrapper exits with $LASTEXITCODE, which
# still holds the last republish.ps1 result, so a run whose only problems were 403s
# and 409s, reported above as warnings, failed the step anyway.
exit 0
