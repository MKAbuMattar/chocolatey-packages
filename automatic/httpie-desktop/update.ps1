import-module Chocolatey-AU
Import-Module (Join-Path $PSScriptRoot '../../au_shared.psm1') -Global

$repo = 'httpie/desktop'

function global:au_SearchReplace { Get-AuSearchReplace }

function global:au_GetLatest {
  # Matched against the names the release actually carries. Upstream file names do not
  # always track the tag, so the URL is never built by hand.
  Get-GitHubLatest -Repo $repo -AssetPattern 'HTTPie-Setup-*.exe'
}

update -ChecksumFor 64
