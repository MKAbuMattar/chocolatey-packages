import-module Chocolatey-AU
Import-Module (Join-Path $PSScriptRoot '../../au_shared.psm1') -Global

$repo = 'meshery/meshery'

function global:au_SearchReplace { Get-AuSearchReplace }

function global:au_GetLatest {
  # Upstream sometimes publishes a release before its build uploads anything: v1.0.72
  # came out with no assets, and building the asset name from its version asked for a
  # file that did not exist. Take the newest release that carries the Windows zip.
  Get-GitHubLatest -Repo $repo -AssetPattern 'mesheryctl_*_Windows_x86_64.zip' -RequireAsset
}

update -ChecksumFor 64
