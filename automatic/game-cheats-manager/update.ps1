import-module Chocolatey-AU
Import-Module (Join-Path $PSScriptRoot '../../au_shared.psm1') -Global

$repo = 'dyang886/Game-Cheats-Manager'

function global:au_SearchReplace { Get-AuSearchReplace }

function global:au_GetLatest {
  Get-GitHubLatest -Repo $repo -Asset 'Game.Cheats.Manager.Setup.{version}.exe'
}

update -ChecksumFor 64
