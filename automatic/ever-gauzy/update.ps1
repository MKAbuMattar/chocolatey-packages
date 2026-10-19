import-module Chocolatey-AU
Import-Module (Join-Path $PSScriptRoot '../../au_shared.psm1') -Global

$repo = 'ever-co/ever-gauzy-agent'

function global:au_SearchReplace { Get-AuSearchReplace }

function global:au_GetLatest {
  # The agent moved out of ever-co/ever-gauzy into its own repository. The main repo's
  # last Windows build was 111.0.11, in July 2026. Here too, some releases carry only
  # the Linux and macOS update manifests, so take the newest stable one with the x64
  # installer.
  Get-GitHubLatest -Repo $repo -AssetPattern 'gauzy-agent-x64-*.exe' -RequireAsset -MaxPages 3
}

update -ChecksumFor 64
