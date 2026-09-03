import-module Chocolatey-AU
Import-Module (Join-Path $PSScriptRoot '../../au_shared.psm1') -Global

$repo = 'OpenBMB/PilotDeck'

function global:au_SearchReplace { Get-AuSearchReplace }

function global:au_GetLatest {
  $release = Get-GitHubRelease -Repo $repo
  $tag = $release.tag_name

  # Upstream dates its tags and has used two formats: v260806 for 6 August 2026, and
  # since September desktop-v2026.09.02. Neither can be ordered as written, so both
  # normalise to YYYY.M.D. Accepting only the older form is what broke the run with
  # "Unexpected tag format: desktop-v2026.09.02".
  $raw = $tag -replace '^desktop-v', '' -replace '^v', ''
  if ($raw -match '^(\d{4})\.(\d{1,2})\.(\d{1,2})$') {
    $version = '{0}.{1}.{2}' -f $Matches[1], [int]$Matches[2], [int]$Matches[3]
  }
  elseif ($raw -match '^(\d{2})(\d{2})(\d{2})$') {
    $version = '20{0}.{1}.{2}' -f $Matches[1], [int]$Matches[2], [int]$Matches[3]
  }
  else { throw "Unexpected tag format: $tag" }

  # The file name does not track the tag either: desktop-v2026.09.02 ships
  # PilotDeck-2026.902.0-win-x64-setup.exe. Take whichever setup exe the release carries.
  $asset = Get-GitHubMatchingAsset -Release $release -Pattern 'PilotDeck-*-win-x64-setup.exe'

  @{
    Version      = $version
    URL64        = $asset.browser_download_url
    ReleaseNotes = Get-GitHubReleaseNotesUrl -Repo $repo -Tag $tag
  }
}

update -ChecksumFor 64
