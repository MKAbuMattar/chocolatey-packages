import-module Chocolatey-AU
Import-Module (Join-Path $PSScriptRoot '../../au_shared.psm1') -Global

$repo = 'jub0t/Concat'

function global:au_SearchReplace { Get-AuSearchReplace }

function global:au_GetLatest {
  # 0.2.3 dropped the Windows zip this package used to unpack, so the constructed
  # name 404'd. Match what the release carries instead of predicting it. The msi is
  # the per-machine build (ALLUSERS=1); the -setup.exe beside it is Tauri's NSIS one.
  Get-GitHubLatest -Repo $repo -AssetPattern 'Concat-*-windows-x86_64.msi'
}

update -ChecksumFor 64
