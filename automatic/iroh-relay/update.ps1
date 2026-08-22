import-module Chocolatey-AU
Import-Module (Join-Path $PSScriptRoot '../../au_shared.psm1') -Global

$repo = 'n0-computer/iroh'

function global:au_SearchReplace { Get-AuSearchReplace }

function global:au_GetLatest {
  Get-GitHubLatest -Repo $repo -Asset 'iroh-relay-v{version}-x86_64-pc-windows-msvc.zip'
}

update -ChecksumFor 64
