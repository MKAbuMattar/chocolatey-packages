import-module Chocolatey-AU
Import-Module (Join-Path $PSScriptRoot '../../au_shared.psm1') -Global

$repo = 'farion1231/cc-switch'

function global:au_SearchReplace { Get-AuSearchReplace }

function global:au_GetLatest {
  # Each release ships both CC-Switch-v<version>-Windows.msi and a -Windows-Portable.zip.
  # The MSI is the one worth packaging, because it registers with Windows and so
  # Chocolatey's auto-uninstaller can remove it. The name carries the version, so it
  # comes from the release rather than being built from the tag.
  Get-GitHubLatest -Repo $repo -AssetPattern '*-Windows.msi'
}

update -ChecksumFor 64
