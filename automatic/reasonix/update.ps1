import-module Chocolatey-AU
Import-Module (Join-Path $PSScriptRoot '../../au_shared.psm1') -Global

$repo = 'esengine/DeepSeek-Reasonix'

function global:au_SearchReplace { Get-AuSearchReplace }

function global:au_GetLatest {
  # One repository releases three things under different tags: v* for the CLI,
  # studio-v* and desktop-v* for the apps. This package is the desktop app.
  Get-GitHubLatest -Repo $repo -TagPrefix 'desktop-v' -AssetPattern 'Reasonix-windows-amd64-installer.exe'
}

update -ChecksumFor 64
