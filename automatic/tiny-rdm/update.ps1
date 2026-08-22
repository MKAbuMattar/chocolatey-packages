import-module Chocolatey-AU
Import-Module (Join-Path $PSScriptRoot '../../au_shared.psm1') -Global

$repo = 'tiny-craft/tiny-rdm'

function global:au_SearchReplace { Get-AuSearchReplace }

function global:au_GetLatest {
  Get-GitHubLatest -Repo $repo -Asset 'TinyRDM_Setup_{version}_windows_x64.exe'
}

update -ChecksumFor 64
