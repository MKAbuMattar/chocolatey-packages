import-module Chocolatey-AU
Import-Module (Join-Path $PSScriptRoot '../../au_shared.psm1') -Global

$repo = 'tinyhumansai/openhuman'

function global:au_SearchReplace { Get-AuSearchReplace }

function global:au_GetLatest {
  Get-GitHubLatest -Repo $repo -Asset 'OpenHuman_{version}_x64_en-US.msi'
}

update -ChecksumFor 64
