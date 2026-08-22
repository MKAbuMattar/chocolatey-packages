import-module Chocolatey-AU
Import-Module (Join-Path $PSScriptRoot '../../au_shared.psm1') -Global

$repo = 'Gaurav-Gosain/tuios'

function global:au_SearchReplace { Get-AuSearchReplace }

function global:au_GetLatest {
  Get-GitHubLatest -Repo $repo -Asset 'tuios_{version}_Windows_x86_64.tar.gz'
}

update -ChecksumFor 64
