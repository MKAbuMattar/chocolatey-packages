import-module Chocolatey-AU
Import-Module (Join-Path $PSScriptRoot '../../au_shared.psm1') -Global

$repo = 'CherryHQ/cherry-studio'

function global:au_SearchReplace { Get-AuSearchReplace }

function global:au_GetLatest {
  # The release also carries a CN build, Cherry-Studio-CN-<version>-win-x64-setup.exe,
  # which a plain wildcard would match too. Require a digit after Cherry-Studio-.
  Get-GitHubLatest -Repo $repo -AssetPattern 'Cherry-Studio-[0-9]*-win-x64-setup.exe'
}

update -ChecksumFor 64
