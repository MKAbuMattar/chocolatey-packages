import-module Chocolatey-AU
Import-Module (Join-Path $PSScriptRoot '../../au_shared.psm1') -Global

$repo = 'storytold/craft-anything'

function global:au_SearchReplace { Get-AuSearchReplace }

function global:au_GetLatest {
  # The release also carries x86 and arm64 MSIs and portable zips; this matches only
  # the x64 MSI.
  Get-GitHubLatest -Repo $repo -AssetPattern 'craft-anything-*-windows-x64.msi'
}

update -ChecksumFor 64
