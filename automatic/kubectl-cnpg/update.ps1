import-module Chocolatey-AU
Import-Module (Join-Path $PSScriptRoot '../../au_shared.psm1') -Global

$repo = 'cloudnative-pg/cloudnative-pg'

function global:au_SearchReplace { Get-AuSearchReplace }

function global:au_GetLatest {
  Get-GitHubLatest -Repo $repo -Asset 'kubectl-cnpg_{version}_windows_x86_64.tar.gz'
}

update -ChecksumFor 64
