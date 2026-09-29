import-module Chocolatey-AU
Import-Module (Join-Path $PSScriptRoot '../../au_shared.psm1') -Global

$repo = 'can1357/oh-my-pi'

function global:au_SearchReplace { Get-AuSearchReplace }

function global:au_GetLatest {
  Get-GitHubLatest -Repo $repo -Asset 'omp-windows-x64.exe'
}

update -ChecksumFor 64
