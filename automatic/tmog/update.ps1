import-module Chocolatey-AU
Import-Module (Join-Path $PSScriptRoot '../../au_shared.psm1') -Global

$site = 'https://tmog.org'

# The release notes page is one page for every version.
function global:au_SearchReplace { Get-AuSearchReplace -NoReleaseNotes }

function global:au_GetLatest {
  # The site's download buttons read this manifest. Its artifact is the versioned file,
  # and the unversioned TMOG-Task-Manager-Setup.exe link changes contents under one URL.
  $release = Invoke-RestMethod "$site/rtm/downloads/release-windows.json" -UseBasicParsing
  if ($release.version -notmatch '^\d+\.\d+\.\d+$') { throw "Unexpected version: '$($release.version)'" }
  $version = $release.version
  if ([int]$release.build -gt 0) { $version += ".$([int]$release.build)" }

  @{
    Version    = $version
    URL64      = "$site$($release.versionedArtifact)"
    Checksum64 = $release.sha256
  }
}

update -ChecksumFor none
