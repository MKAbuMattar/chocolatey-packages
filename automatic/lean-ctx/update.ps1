import-module Chocolatey-AU
Import-Module (Join-Path $PSScriptRoot '../../au_shared.psm1') -Global

$repo = 'yvgude/lean-ctx'

function global:au_SearchReplace { Get-AuSearchReplace }

function global:au_GetLatest {
  Get-GitHubLatest -Repo $repo -Asset 'lean-ctx-x86_64-pc-windows-msvc.zip'
}

update -ChecksumFor 64
