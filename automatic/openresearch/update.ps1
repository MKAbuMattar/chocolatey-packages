import-module Chocolatey-AU
Import-Module (Join-Path $PSScriptRoot '../../au_shared.psm1') -Global

$repo = 'alphaXiv/OpenResearch'

function global:au_SearchReplace { Get-AuSearchReplace }

function global:au_GetLatest {
  Get-GitHubLatest -Repo $repo -Asset 'openresearch-cli-x86_64-pc-windows-msvc.zip'
}

update -ChecksumFor 64
