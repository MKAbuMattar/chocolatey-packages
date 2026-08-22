import-module Chocolatey-AU
Import-Module (Join-Path $PSScriptRoot '../../au_shared.psm1') -Global

$repo = 'novincode/dlman'

function global:au_SearchReplace { Get-AuSearchReplace }

function global:au_GetLatest {
  # The asset name cannot be built from the tag. Upstream shipped v1.12.0 with every file
  # still named 1.11.1, a different build to v1.11.1 despite the name, so a constructed
  # URL 404s. Take whichever x64 MSI the release actually carries.
  Get-GitHubLatest -Repo $repo -AssetPattern '*_x64_en-US.msi'
}

update -ChecksumFor 64
