import-module Chocolatey-AU
Import-Module (Join-Path $PSScriptRoot '../../au_shared.psm1') -Global

$repo = 'boring-registry/boring-registry'

function global:au_SearchReplace { Get-AuSearchReplace }

function global:au_GetLatest {
  Get-GitHubLatest -Repo $repo -Asset 'boring-registry_{version}_Windows_x86_64.tar.gz'
}

update -ChecksumFor 64
