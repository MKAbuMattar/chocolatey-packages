import-module Chocolatey-AU
Import-Module (Join-Path $PSScriptRoot '../../au_shared.psm1') -Global

$repo = 'storytold/wordcraft'

function global:au_SearchReplace { Get-AuSearchReplace }

function global:au_GetLatest {
  # The x64 portable zip, not the MSI; chocolateyInstall.ps1 says why.
  Get-GitHubLatest -Repo $repo -AssetPattern 'wordcraft-*-windows-x64-portable.zip'
}

update -ChecksumFor 64
