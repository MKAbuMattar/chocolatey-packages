import-module Chocolatey-AU
Import-Module (Join-Path $PSScriptRoot '../../au_shared.psm1') -Global

$repo = 'genspark-ai/genoffice'

function global:au_SearchReplace { Get-AuSearchReplace }

function global:au_GetLatest {
  # The installer gained an -x64 suffix, so GenOfficeSetup-v<version>.exe now 404s and
  # the release also carries an arm64 build. Match the x64 one the release actually has.
  Get-GitHubLatest -Repo $repo -AssetPattern 'GenOfficeSetup-v*-x64.exe'

}

update -ChecksumFor 64
