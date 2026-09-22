import-module Chocolatey-AU
Import-Module (Join-Path $PSScriptRoot '../../au_shared.psm1') -Global

$repo = 'debpalash/VoiceStudio'

function global:au_SearchReplace { Get-AuSearchReplace }

function global:au_GetLatest {
  # 0.5.5 moved the app from Tauri to Electron, so the MSI this package installed is
  # gone and the release ships one Windows build, an electron-builder NSIS exe. Match
  # what is there rather than spell out a name upstream no longer uses.
  Get-GitHubLatest -Repo $repo -AssetPattern 'VoiceStudio-Electron-*-win-x64.exe'
}

update -ChecksumFor 64
