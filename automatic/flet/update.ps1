import-module Chocolatey-AU
Import-Module (Join-Path $PSScriptRoot '../../au_shared.psm1') -Global

$repo = 'flet-dev/flet'

function global:au_SearchReplace { Get-AuSearchReplace }

function global:au_GetLatest {
  # Matched against the names the release actually carries. Upstream file names do not
  # always track the tag, so the URL is never built by hand.
  Get-GitHubLatest -Repo $repo -AssetPattern 'flet-windows.zip'
}

update -ChecksumFor 64
