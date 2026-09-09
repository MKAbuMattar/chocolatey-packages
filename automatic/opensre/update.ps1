import-module Chocolatey-AU
Import-Module (Join-Path $PSScriptRoot '../../au_shared.psm1') -Global

$repo = 'Tracer-Cloud/opensre'

function global:au_SearchReplace { Get-AuSearchReplace }

function global:au_GetLatest {
  $release = Get-GitHubRelease -Repo $repo
  $tag = $release.tag_name
  $raw = $tag -replace '^v', ''

  # Upstream tags as v0.1.YYYY.M.D, which is five components. NuGet allows four, so AU
  # failed the run with "Invalid version: 0.1.2026.9.6". The leading 0.1 has not moved
  # across any release and the date is what identifies a build, so drop it and keep
  # YYYY.M.D. That still orders correctly, and 2026.9.10 sorts after 2026.9.9.
  if ($raw -notmatch '^\d+\.\d+\.(\d{4})\.(\d{1,2})\.(\d{1,2})$') { throw "Unexpected tag format: $tag" }
  $version = '{0}.{1}.{2}' -f $Matches[1], [int]$Matches[2], [int]$Matches[3]

  # The asset keeps the full upstream version, so it cannot be built from $version.
  $asset = Get-GitHubMatchingAsset -Release $release -Pattern 'opensre_*_windows-x64.zip'

  @{
    Version      = $version
    URL64        = $asset.browser_download_url
    ReleaseNotes = Get-GitHubReleaseNotesUrl -Repo $repo -Tag $tag
  }
}
update -ChecksumFor 64
