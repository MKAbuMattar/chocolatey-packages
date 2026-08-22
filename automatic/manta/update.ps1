import-module Chocolatey-AU
Import-Module (Join-Path $PSScriptRoot '../../au_shared.psm1') -Global

$repo = 'hql287/Manta'

function global:au_SearchReplace { Get-AuSearchReplace }

function global:au_GetLatest {
  # Matched against the names the release actually carries. Upstream file names do not
  # always track the tag, so the URL is never built by hand.
  Get-GitHubLatest -Repo $repo -AssetPattern 'Manta.*.exe'
}

update -ChecksumFor 64
