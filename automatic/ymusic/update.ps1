import-module Chocolatey-AU
Import-Module (Join-Path $PSScriptRoot '../../au_shared.psm1') -Global

$repo = 'ymusic-io/YMusicV4'

function global:au_SearchReplace { Get-AuSearchReplace }

function global:au_GetLatest {
  # Releases are tagged release-v<version>. The release also carries an arm64 setup,
  # Android, Linux and macOS builds; this matches only the x64 setup.
  Get-GitHubLatest -Repo $repo -TagPrefix 'release-v' -AssetPattern 'YMusic-*-windows-x64-setup.exe'
}

update -ChecksumFor 64
