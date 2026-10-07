import-module Chocolatey-AU
Import-Module (Join-Path $PSScriptRoot '../../au_shared.psm1') -Global

$repo = 'storytold/artcraft'

function global:au_SearchReplace { Get-AuSearchReplace }

function global:au_GetLatest {
  # The repository tags each release artcraft-v<version>, and the release carries an
  # NSIS exe and a macOS build beside the MSI; this matches only the x64 MSI.
  Get-GitHubLatest -Repo $repo -TagPrefix 'artcraft-v' -AssetPattern 'ArtCraft_*_x64_en-US.msi'
}

update -ChecksumFor 64
