import-module Chocolatey-AU
Import-Module (Join-Path $PSScriptRoot '../../au_shared.psm1') -Global

$repo = 'debpalash/VoiceStudio'

function global:au_SearchReplace { Get-AuSearchReplace }

function global:au_GetLatest {
  # Upstream ships a per-machine MSI and a VoiceStudio_Current_User_* one beside it.
  # Chocolatey installs for the whole machine, so the name is spelled out rather than
  # matched by pattern, which would be free to pick either.
  Get-GitHubLatest -Repo $repo -Asset 'VoiceStudio_{version}_x64_en-US.msi'
}

update -ChecksumFor 64
