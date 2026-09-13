import-module Chocolatey-AU
Import-Module (Join-Path $PSScriptRoot '../../au_shared.psm1') -Global

# AutoClaw is not on GitHub. It is an Electron app, and electron-builder publishes the
# feed its own updater reads, so that is what this tracks rather than scraping the
# marketing page: it names the current version and the exact file being served.
$feed = 'https://autoglm-public-oss.z.ai/autoclaw/updates/latest.yml'

# <releaseNotes> points at the changelog page rather than a per-release one, so nothing
# in the nuspec changes with the version and AU has to leave it alone.
function global:au_SearchReplace { Get-AuSearchReplace -NoReleaseNotes }

function global:au_GetLatest {
  $yml = (Invoke-WebRequest -Uri $feed -UseBasicParsing).Content

  # A three key subset of YAML, not a parser: version, and the setup file under path.
  if ($yml -notmatch '(?m)^version:\s*(\S+)\s*$') { throw "No version in $feed" }
  $version = $Matches[1]

  if ($yml -notmatch '(?m)^path:\s*(\S+\.exe)\s*$') { throw "No installer path in $feed" }
  $file = $Matches[1]

  @{
    Version = $version
    URL64   = "https://autoglm-public-oss.z.ai/autoclaw/updates/$file"
  }
}

update -ChecksumFor 64
