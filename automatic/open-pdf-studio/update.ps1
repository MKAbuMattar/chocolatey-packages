import-module Chocolatey-AU
Import-Module (Join-Path $PSScriptRoot '../../au_shared.psm1') -Global

$repo = 'OpenAEC-Foundation/open-pdf-studio'

function global:au_SearchReplace { Get-AuSearchReplace }

function global:au_GetLatest {
  # Upstream moved to date versions at 2026.39 and pads the file name to three parts
  # (2026.39.0) while the tag keeps two, so a name built from the tag 404s. The
  # release also carries an _x64_user-setup.exe; this pattern only matches the
  # per-machine build, which is the one Chocolatey should install.
  Get-GitHubLatest -Repo $repo -AssetPattern 'Open.PDF.Studio_*_x64-setup.exe'
}

update -ChecksumFor 64
