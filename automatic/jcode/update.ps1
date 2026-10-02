import-module Chocolatey-AU
Import-Module (Join-Path $PSScriptRoot '../../au_shared.psm1') -Global

$repo = '1jehuang/jcode'

function global:au_SearchReplace { Get-AuSearchReplace }

function global:au_GetLatest {
  Get-GitHubLatest -Repo $repo -AssetPattern 'jcode-windows-x86_64.exe'
}

update -ChecksumFor 64
