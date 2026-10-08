import-module Chocolatey-AU
Import-Module (Join-Path $PSScriptRoot '../../au_shared.psm1') -Global

$repo = 'Techx3/TouchePX5'

function global:au_SearchReplace { Get-AuSearchReplace }

function global:au_GetLatest {
  # Upstream has only ever published betas, tagged v<x.y.z>-beta.<n>. That is kept as a
  # Chocolatey prerelease, 0.0.2-beta6, so it sorts before an eventual 0.0.2 release.
  $release = Get-GitHubRelease -Repo $repo -TagPattern '^v\d+\.\d+\.\d+' -WithAssetPattern 'touchepx5-*-win-x64.zip'
  $tag = $release.tag_name
  if ($tag -notmatch '^v(\d+\.\d+\.\d+)(?:-beta\.(\d+))?$') { throw "Unexpected tag format: $tag" }
  $version = $Matches[1]
  if ($Matches[2]) { $version += '-beta{0}' -f [int]$Matches[2] }
  $asset = Get-GitHubMatchingAsset -Release $release -Pattern 'touchepx5-*-win-x64.zip'
  @{
    Version      = $version
    URL64        = $asset.browser_download_url
    ReleaseNotes = Get-GitHubReleaseNotesUrl -Repo $repo -Tag $tag
  }
}

update -ChecksumFor 64
