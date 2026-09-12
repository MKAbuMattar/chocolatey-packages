import-module Chocolatey-AU
Import-Module (Join-Path $PSScriptRoot '../../au_shared.psm1') -Global

$repo = 'eneskirca/nodeterm'

function global:au_SearchReplace { Get-AuSearchReplace }

function global:au_GetLatest {
  # Windows is recent here. v0.3.3 is the first release to carry a Windows build, and
  # v0.3.2 and everything before it shipped macOS and Linux only. The installer name
  # carries the version, so it cannot be matched as a literal asset and -RequireAsset
  # cannot be used. Walk the releases instead and take the newest stable one that
  # actually has an installer, rather than failing the run when a release ships without.
  $headers = Get-GitHubHeaders
  $releases = Invoke-RestMethod "https://api.github.com/repos/$repo/releases?per_page=30" -Headers $headers

  $release = $releases | Where-Object {
    -not $_.prerelease -and ($_.assets.name -match '^nodeterm-Setup-.*\.exe$')
  } | Select-Object -First 1

  if (!$release) { throw "No stable release of $repo carries a nodeterm-Setup exe" }

  $tag = $release.tag_name
  $asset = Get-GitHubMatchingAsset -Release $release -Pattern 'nodeterm-Setup-*.exe'

  @{
    Version      = Get-VersionFromTag -Tag $tag
    URL64        = $asset.browser_download_url
    ReleaseNotes = Get-GitHubReleaseNotesUrl -Repo $repo -Tag $tag
  }
}

update -ChecksumFor 64
