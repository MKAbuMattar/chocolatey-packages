import-module Chocolatey-AU
Import-Module (Join-Path $PSScriptRoot '../../au_shared.psm1') -Global

$repo = 'QwenAudio/qwen-audio-agent'

function global:au_SearchReplace { Get-AuSearchReplace }

function global:au_GetLatest {
  Get-GitHubLatest -Repo $repo -Asset 'qwen-audio-agent-{version}-win-x64.exe'
}

update -ChecksumFor 64
