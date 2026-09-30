import-module Chocolatey-AU
Import-Module (Join-Path $PSScriptRoot '../../au_shared.psm1') -Global

$repo = 'KytyPS5/KytyPS5'

function global:au_SearchReplace { Get-AuSearchReplace }

function global:au_GetLatest {
  # Upstream publishes a build per commit, often several a day, tagged
  # KytyPS5-2026-09-30-8ba2caf. The hash cannot be ordered and the date is shared by
  # every build that day, so versioning by the tag's date packaged only the first build
  # of each day and skipped the rest.
  #
  # The API does not list releases in publish order either: on 29 Sep it put af4edc2
  # (20:20) above 05057c9 (21:03). Taking the first match could package an older build
  # than the newest, so sort by publish time and take the newest that ships Windows.
  $releases = Invoke-RestMethod "https://api.github.com/repos/$repo/releases?per_page=100" -Headers (Get-GitHubHeaders)
  $release = $releases |
    Where-Object { -not $_.prerelease -and ($_.assets.name -like 'KytyPS5-*-Windows-x64.zip') } |
    Sort-Object { ConvertTo-UtcTime $_.published_at } -Descending |
    Select-Object -First 1
  if (!$release) { throw "No release of $repo carries a Windows build" }

  # Version is the publish time in UTC, YYYY.M.D.HHMM: every build gets its own number,
  # and date and time come from the same instant, so a later build always sorts higher,
  # across midnight too. 8ba2caf, published 13:57, is 2026.9.30.1357.
  $t = ConvertTo-UtcTime $release.published_at
  $version = '{0}.{1}.{2}.{3}' -f $t.Year, $t.Month, $t.Day, ($t.Hour * 100 + $t.Minute)

  $asset = Get-GitHubMatchingAsset -Release $release -Pattern 'KytyPS5-*-Windows-x64.zip'
  @{
    Version      = $version
    URL64        = $asset.browser_download_url
    ReleaseNotes = Get-GitHubReleaseNotesUrl -Repo $repo -Tag $release.tag_name
  }
}

function global:ConvertTo-UtcTime {
  # Windows PowerShell 5.1, which the workflow runs, leaves published_at as a string;
  # PowerShell 7 turns it into a local DateTime. Normalise both to UTC.
  param($Value)
  if ($Value -is [datetime]) { return $Value.ToUniversalTime() }
  [datetime]::Parse($Value, [Globalization.CultureInfo]::InvariantCulture,
    [Globalization.DateTimeStyles]'AdjustToUniversal, AssumeUniversal')
}

update -ChecksumFor 64
