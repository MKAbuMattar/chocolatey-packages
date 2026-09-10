import-module Chocolatey-AU
Import-Module (Join-Path $PSScriptRoot '../../au_shared.psm1') -Global

$repo = 'tonhowtf/omniget'

function global:au_SearchReplace { Get-AuSearchReplace }

function global:au_GetLatest {
  # A Tauri MSI, named omniget_<version>_x64_en-US.msi. dlman uses the same Tauri
  # naming and shipped a release where the file kept the previous version, so the
  # name comes from the release rather than being built from the tag.
  # The release also carries omniget-cli-<version>-x86_64-pc-windows-msvc.zip; this
  # package is the desktop application, so match only the MSI.
  Get-GitHubLatest -Repo $repo -AssetPattern '*_x64_en-US.msi'
}

update -ChecksumFor 64
