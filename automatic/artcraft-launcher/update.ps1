import-module Chocolatey-AU
Import-Module (Join-Path $PSScriptRoot '../../au_shared.psm1') -Global

$repo = 'storytold/craft-launcher'

function global:au_SearchReplace { Get-AuSearchReplace }

function global:au_GetLatest {
  # The repository is craft-launcher but its files are named artcraft-launcher. The
  # release also carries an arm64 MSI and portable zips; this matches only the x64 MSI.
  Get-GitHubLatest -Repo $repo -AssetPattern 'artcraft-launcher-*-windows-x64.msi'
}

update -ChecksumFor 64
