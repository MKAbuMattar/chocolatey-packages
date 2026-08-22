import-module Chocolatey-AU
Import-Module (Join-Path $PSScriptRoot '../../au_shared.psm1') -Global

$repo = 'NeuralNomadsAI/CodeNomad'

function global:au_SearchReplace { Get-AuSearchReplace }

function global:au_GetLatest {
  Get-GitHubLatest -Repo $repo -Asset 'CodeNomad-Electron-windows-x64-{version}.zip'
}

update -ChecksumFor 64
