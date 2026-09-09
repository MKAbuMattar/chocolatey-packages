import-module Chocolatey-AU
Import-Module (Join-Path $PSScriptRoot '../../au_shared.psm1') -Global

$repo = 'QwenLM/qwen-code'

function global:au_SearchReplace { Get-AuSearchReplace }

function global:au_GetLatest {
  # /releases/latest returns sibling components such as sdk-typescript-v0.1.11, which
  # is not a version Chocolatey can order. Take the newest plain v-tagged release.
  Get-GitHubLatest -Repo $repo -TagPattern '^v\d' -Asset 'qwen-code-win-x64.zip' -RequireAsset
}

update -ChecksumFor 64
