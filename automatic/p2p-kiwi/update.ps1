import-module Chocolatey-AU
Import-Module (Join-Path $PSScriptRoot '../../au_shared.psm1') -Global

$repo = 'dont-be-evil-company/p2p.kiwi'

function global:au_SearchReplace { Get-AuSearchReplace }

function global:au_GetLatest {
  Get-GitHubLatest -Repo $repo -Asset 'p2p-kiwi-setup_x64.exe'

}

update -ChecksumFor 64
