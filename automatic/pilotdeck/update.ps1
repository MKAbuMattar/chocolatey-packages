import-module Chocolatey-AU
Import-Module (Join-Path $PSScriptRoot '../../au_shared.psm1') -Global

$repo = 'OpenBMB/PilotDeck'

function global:au_SearchReplace { Get-AuSearchReplace }

function global:au_GetLatest {
  $tag = (Get-GitHubRelease -Repo $repo).tag_name

  # Upstream tags releases by date, as v260806 for 6 August 2026, which is not a
  # version Chocolatey can order. Expand it to 2026.8.6 while the download URL
  # keeps the raw form.
  $raw = Get-VersionFromTag -Tag $tag
  if ($raw -notmatch '^(\d{2})(\d{2})(\d{2})$') { throw "Unexpected tag format: $tag" }
  $version = '20{0}.{1}.{2}' -f $Matches[1], [int]$Matches[2], [int]$Matches[3]

  @{
    Version      = $version
    URL64        = Get-GitHubAssetUrl -Repo $repo -Tag $tag -Asset "PilotDeck-$raw-win-x64-setup.exe"
    ReleaseNotes = Get-GitHubReleaseNotesUrl -Repo $repo -Tag $tag
  }
}

update -ChecksumFor 64
