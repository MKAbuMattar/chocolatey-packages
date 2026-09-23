import-module Chocolatey-AU
Import-Module (Join-Path $PSScriptRoot '../../au_shared.psm1') -Global

$repo = 'ever-co/ever-gauzy'

function global:au_SearchReplace { Get-AuSearchReplace }

function global:au_GetLatest {
  # Upstream tags a release for almost every merge and attaches a Windows build to
  # very few. The newest stable one carrying the agent is 111.0.11, from July, and it
  # sits 352 releases down, so the default single page of 100 never reaches it and
  # taking the newest tag asked for a file that had never existed. Eight pages gives
  # roughly six months of headroom at the four releases a day upstream currently
  # makes. When this starts failing, the last Windows build has fallen past 800
  # releases and the package has nothing left to track.
  Get-GitHubLatest -Repo $repo -AssetPattern 'gauzy-agent-x64-*.exe' -RequireAsset -MaxPages 8
}

update -ChecksumFor 64
