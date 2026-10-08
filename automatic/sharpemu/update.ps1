import-module Chocolatey-AU
Import-Module (Join-Path $PSScriptRoot '../../au_shared.psm1') -Global

$repo = 'sharpemu/sharpemu'

function global:au_SearchReplace { Get-AuSearchReplace }

function global:au_GetLatest {
  # SharpEmu's tag suffixes do not order: it published v0.0.2-beta.2 to beta.5 after
  # v0.0.2, a hotfix-2 then a release.2 for v0.0.3, then a release.3-patch.1 and a
  # codename, v0.0.5-nexus. Any rule that reads the suffix sent some release backwards.
  # So the version is x.y.z from the tag plus the release's publish time, in minutes
  # since 2026-01-01 UTC: a later release always sorts higher, whatever it is named.
  # Replayed over all 16 tags to date, every one sorts after the one before it.
  #
  # The API does not list releases in publish order either, so sort by time here.
  # Older win64-main-<hash> build tags are not releases of a version and are skipped.
  $release = Invoke-GitHubApi "https://api.github.com/repos/$repo/releases?per_page=100" |
    Where-Object { -not $_.prerelease -and $_.tag_name -match '^v\d+\.\d+\.\d+' -and
      ($_.assets.name -like 'sharpemu-*-win-x64.zip') } |
    Sort-Object { ConvertTo-UtcTime $_.published_at } -Descending |
    Select-Object -First 1
  if (!$release) { throw "No release of $repo carries a Windows build" }

  $tag = $release.tag_name
  $null = $tag -match '^v(\d+\.\d+\.\d+)'
  $minutes = [math]::Floor(((ConvertTo-UtcTime $release.published_at) -
      [datetime]::new(2026, 1, 1, 0, 0, 0, [DateTimeKind]::Utc)).TotalMinutes)
  $asset = Get-GitHubMatchingAsset -Release $release -Pattern 'sharpemu-*-win-x64.zip'
  @{
    Version      = '{0}.{1}' -f $Matches[1], [int]$minutes
    URL64        = $asset.browser_download_url
    ReleaseNotes = Get-GitHubReleaseNotesUrl -Repo $repo -Tag $tag
  }
}

function global:ConvertTo-UtcTime {
  # Windows PowerShell 5.1 leaves published_at a string; PowerShell 7 makes it a local
  # DateTime. Normalise both to UTC.
  param($Value)
  if ($Value -is [datetime]) { return $Value.ToUniversalTime() }
  [datetime]::Parse($Value, [Globalization.CultureInfo]::InvariantCulture,
    [Globalization.DateTimeStyles]'AdjustToUniversal, AssumeUniversal')
}

update -ChecksumFor 64
