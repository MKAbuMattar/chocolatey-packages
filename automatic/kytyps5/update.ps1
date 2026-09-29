import-module Chocolatey-AU
Import-Module (Join-Path $PSScriptRoot '../../au_shared.psm1') -Global

$repo = 'KytyPS5/KytyPS5'

function global:au_SearchReplace { Get-AuSearchReplace }

function global:au_GetLatest {
  # Upstream publishes a build per commit, several a day, tagged
  # KytyPS5-2026-09-29-73615c3. Versioning each one would push a Chocolatey version per
  # commit and flood moderation, so the version is the tag's date: at most one release
  # a day. Some builds ship only for macOS, so require the Windows archive.
  $release = Get-GitHubRelease -Repo $repo -WithAssetPattern 'KytyPS5-*-Windows-x64.zip'
  $tag = $release.tag_name
  if ($tag -notmatch '^KytyPS5-(\d{4})-(\d{2})-(\d{2})-[0-9a-f]+$') { throw "Unexpected tag format: $tag" }
  $version = '{0}.{1}.{2}' -f $Matches[1], [int]$Matches[2], [int]$Matches[3]
  $asset = Get-GitHubMatchingAsset -Release $release -Pattern 'KytyPS5-*-Windows-x64.zip'
  @{
    Version      = $version
    URL64        = $asset.browser_download_url
    ReleaseNotes = Get-GitHubReleaseNotesUrl -Repo $repo -Tag $tag
  }
}

update -ChecksumFor 64
