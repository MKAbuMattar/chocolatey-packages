import-module Chocolatey-AU
Import-Module (Join-Path $PSScriptRoot '../../au_shared.psm1') -Global

$repo = 'mistweaverco/bananas'

function global:au_SearchReplace { Get-AuSearchReplace }

function global:au_GetLatest {
  # Upstream renamed the project from Bananas to p2p.kiwi at v1.0.0, and the installer
  # went from bananas-setup_x64.exe to p2p-kiwi-setup_x64.exe. The repository slug did
  # not change, so match on the suffix and let the release say what the file is called.
  Get-GitHubLatest -Repo $repo -AssetPattern '*-setup_x64.exe'
}

update -ChecksumFor 64
