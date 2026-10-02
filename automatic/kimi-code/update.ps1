import-module Chocolatey-AU
Import-Module (Join-Path $PSScriptRoot '../../au_shared.psm1') -Global

$repo = 'MoonshotAI/kimi-code'

function global:au_SearchReplace { Get-AuSearchReplace }

function global:au_GetLatest {
  # The repository tags each package it publishes, so the CLI's releases are the ones
  # tagged @moonshot-ai/kimi-code@<version>. The URL comes from the release itself
  # because the tag carries characters (@ and /) a hand-built URL would have to escape.
  Get-GitHubLatest -Repo $repo -TagPrefix '@moonshot-ai/kimi-code@' -AssetPattern 'kimi-code-win32-x64.zip'
}

update -ChecksumFor 64
