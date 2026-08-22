import-module Chocolatey-AU
Import-Module (Join-Path $PSScriptRoot '../../au_shared.psm1') -Global

$repo = 'OpenAEC-Foundation/open-pdf-studio'

function global:au_SearchReplace { Get-AuSearchReplace }

function global:au_GetLatest {
  Get-GitHubLatest -Repo $repo -Asset 'Open.PDF.Studio_{version}_x64-setup.exe'
}

update -ChecksumFor 64
