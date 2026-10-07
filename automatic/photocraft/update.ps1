import-module Chocolatey-AU
Import-Module (Join-Path $PSScriptRoot '../../au_shared.psm1') -Global

$repo = 'storytold/photocraft'

function global:au_SearchReplace { Get-AuSearchReplace }

function global:au_GetLatest {
  # The release also carries x86 and arm64 MSIs and portable zips; this matches only
  # the x64 installer.
  Get-GitHubLatest -Repo $repo -AssetPattern 'photocraft-*-windows-x64.msi'
}

update -ChecksumFor 64
