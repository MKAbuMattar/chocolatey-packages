import-module Chocolatey-AU
Import-Module (Join-Path $PSScriptRoot '../../au_shared.psm1') -Global

$repo = 'MKAbuMattar/sarab'

function global:au_SearchReplace { Get-AuSearchReplace }

function global:au_GetLatest {
  Get-GitHubLatest -Repo $repo -AssetPattern 'Sarab_*_x64-setup.exe'
}

update -ChecksumFor 64
