import-module Chocolatey-AU
Import-Module (Join-Path $PSScriptRoot '../../au_shared.psm1') -Global

$repo = 'craze1pirate/craziiEmu'

function global:au_SearchReplace { Get-AuSearchReplace }

function global:au_GetLatest {
  # Every release is tagged v<x.y>-alpha, and has been since the first. Keeping the
  # suffix would make each one a Chocolatey prerelease, invisible without --pre, so the
  # package version drops it; the description says the software is alpha.
  $release = Get-GitHubRelease -Repo $repo -TagPattern '^v\d+\.\d+' -WithAssetPattern 'craziiemu-*-win-x64.zip'
  $tag = $release.tag_name
  if ($tag -notmatch '^v(\d+\.\d+(?:\.\d+)?)(?:-alpha)?$') { throw "Unexpected tag format: $tag" }
  $version = $Matches[1]
  $asset = Get-GitHubMatchingAsset -Release $release -Pattern 'craziiemu-*-win-x64.zip'
  @{
    Version      = $version
    URL64        = $asset.browser_download_url
    ReleaseNotes = Get-GitHubReleaseNotesUrl -Repo $repo -Tag $tag
  }
}

update -ChecksumFor 64
