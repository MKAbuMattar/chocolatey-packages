import-module Chocolatey-AU
Import-Module (Join-Path $PSScriptRoot '../../au_shared.psm1') -Global

$repo = 'codewhale-hq/Codewhale'

function global:au_SearchReplace { Get-AuSearchReplace }

function global:au_GetLatest {
  Get-GitHubLatest -Repo $repo -AssetPattern 'codewhale-windows-x64.zip'
}

update -ChecksumFor 64
