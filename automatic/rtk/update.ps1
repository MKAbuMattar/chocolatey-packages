import-module Chocolatey-AU
Import-Module (Join-Path $PSScriptRoot '../../au_shared.psm1') -Global

$repo = 'rtk-ai/rtk'

function global:au_SearchReplace { Get-AuSearchReplace }

function global:au_GetLatest {
  # Upstream publishes dev-<version>-rc.<n> prereleases between stable tags, which
  # /releases/latest already skips. -RequireAsset keeps it on a release that actually
  # carries the Windows zip rather than one that only has the macOS tarball.
  Get-GitHubLatest -Repo $repo -Asset 'rtk-x86_64-pc-windows-msvc.zip' -RequireAsset
}

update -ChecksumFor 64
