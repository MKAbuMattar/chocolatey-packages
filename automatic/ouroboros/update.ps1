import-module Chocolatey-AU
Import-Module (Join-Path $PSScriptRoot '../../au_shared.psm1') -Global

$repo = 'Q00/ouroboros'

function global:au_SearchReplace { Get-AuSearchReplace }

function global:au_GetLatest {
  Get-GitHubLatest -Repo $repo -Asset 'ouroboros-tui-x86_64-pc-windows-msvc.exe'
}

update -ChecksumFor 64
