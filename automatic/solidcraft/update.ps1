import-module Chocolatey-AU
Import-Module (Join-Path $PSScriptRoot '../../au_shared.psm1') -Global

$repo = 'tangency-labs/solidcraft'

function global:au_SearchReplace { Get-AuSearchReplace }

function global:au_GetLatest {
  # The release also carries x86 and arm64 MSIs, an exe installer, portable zips, and
  # unversioned copies of each; this matches only the versioned x64 MSI.
  Get-GitHubLatest -Repo $repo -AssetPattern 'solidcraft-*-windows-x64.msi'
}

update -ChecksumFor 64
