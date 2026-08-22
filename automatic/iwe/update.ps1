import-module Chocolatey-AU
Import-Module (Join-Path $PSScriptRoot '../../au_shared.psm1') -Global

$repo = 'iwe-org/iwe'

function global:au_SearchReplace { Get-AuSearchReplace }

function global:au_GetLatest {
  $release = Get-GitHubRelease -Repo $repo
  $tag = $release.tag_name

  # Upstream tags as 'iwe-v<version>', and the asset name does not track the tag,
  # so the URL comes from the names the release actually carries.
  $asset = Get-GitHubMatchingAsset -Release $release -Pattern 'iwe-*-x86_64-pc-windows-msvc.zip'

  @{
    Version      = Get-VersionFromTag -Tag $tag -Prefix 'iwe-'
    URL64        = $asset.browser_download_url
    ReleaseNotes = Get-GitHubReleaseNotesUrl -Repo $repo -Tag $tag
  }
}

update -ChecksumFor 64
