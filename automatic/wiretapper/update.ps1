import-module Chocolatey-AU
Import-Module (Join-Path $PSScriptRoot '../../au_shared.psm1') -Global

$repo = 'h9zdev/WireTapper'

function global:au_SearchReplace { Get-AuSearchReplace }

function global:au_GetLatest {
  $release = Get-GitHubRelease -Repo $repo
  $tag = $release.tag_name

  # The tag never changes and carries no version, so date the release instead.
  $published = [datetime]$release.published_at
  $version = '{0}.{1}.{2}' -f $published.Year, $published.Month, $published.Day

  @{
    Version      = $version
    URL64        = Get-GitHubAssetUrl -Repo $repo -Tag $tag -Asset 'app-web.exe'
    ReleaseNotes = Get-GitHubReleaseNotesUrl -Repo $repo -Tag $tag
  }
}

update -ChecksumFor 64
