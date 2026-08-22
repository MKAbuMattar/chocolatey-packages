import-module Chocolatey-AU
Import-Module (Join-Path $PSScriptRoot '../../au_shared.psm1') -Global

$repo = 'block/buzz'

function global:au_SearchReplace { Get-AuSearchReplace }

function global:au_GetLatest {
  # block/buzz publishes several components, and tags this one as 'desktop-v<version>',
  # so take the newest release carrying that prefix rather than whatever is latest.
  Get-GitHubLatest -Repo $repo -TagPrefix 'desktop-v' `
    -Asset 'Buzz_{version}_x64-setup_alpha-unsigned.exe'
}

update -ChecksumFor 64
