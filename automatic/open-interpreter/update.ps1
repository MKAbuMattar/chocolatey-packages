import-module Chocolatey-AU
Import-Module (Join-Path $PSScriptRoot '../../au_shared.psm1') -Global

$repo = 'openinterpreter/openinterpreter'

function global:au_SearchReplace { Get-AuSearchReplace }

function global:au_GetLatest {
  # openinterpreter/openinterpreter tags releases as 'rust-v<version>', and publishes other
  # components too, so take the newest tag carrying this prefix
  Get-GitHubLatest -Repo $repo -TagPrefix 'rust-v' `
    -Asset 'open-interpreter-package-x86_64-pc-windows-msvc.tar.gz'
}

update -ChecksumFor 64
