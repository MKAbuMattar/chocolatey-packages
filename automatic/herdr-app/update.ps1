import-module Chocolatey-AU
Import-Module (Join-Path $PSScriptRoot '../../au_shared.psm1') -Global

# The release notes link is the commit log, which does not change per version.
function global:au_SearchReplace { Get-AuSearchReplace -NoReleaseNotes }

function global:au_GetLatest {
  # No GitHub releases: herdr publishes builds on its own server, and its install.ps1
  # reads this manifest. Its URL carries the version, so it never changes contents.
  $release = Invoke-RestMethod 'https://releases.herdr.dev/app/latest.json' -UseBasicParsing
  $build = $release.targets.'windows-x86_64'
  if ($release.version -notmatch '^\d+\.\d+\.\d+$' -or !$build.url -or !$build.sha256) {
    throw "Unexpected herdr manifest: version '$($release.version)'"
  }
  @{
    Version    = $release.version
    URL64      = $build.url
    Checksum64 = $build.sha256
  }
}

update -ChecksumFor none
