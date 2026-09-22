import-module Chocolatey-AU
Import-Module (Join-Path $PSScriptRoot '../../au_shared.psm1') -Global

$repo = 'ever-co/ever-gauzy'

function global:au_SearchReplace { Get-AuSearchReplace }

function global:au_GetLatest {
  # Upstream tags a release for almost every merge and attaches a build to very few:
  # of the last 800 releases, 89 carry any asset, and the newest with a Windows agent
  # is 111.0.12. Taking the newest tag gave a URL that had never existed, so require
  # the asset and let the assetless tags be skipped.
  Get-GitHubLatest -Repo $repo -AssetPattern 'gauzy-agent-x64-*.exe' -RequireAsset
}

update -ChecksumFor 64
