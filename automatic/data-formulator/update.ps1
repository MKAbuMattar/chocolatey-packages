import-module Chocolatey-AU
Import-Module (Join-Path $PSScriptRoot '../../au_shared.psm1') -Global

$repo = 'microsoft/data-formulator'

function global:au_SearchReplace { Get-AuSearchReplace }

function global:au_GetLatest {
  $latest = Get-GitHubLatest -Repo $repo -Asset 'Data-Formulator-Windows-x64.zip'

  # Upstream tags betas as <major>.<minor>b<n>, which is not a valid Chocolatey
  # version, so turn 0.8b1 into the pre-release 0.8-b1. The suffix goes on after
  # the URL is built, because the asset name carries no version at all.
  $latest.Version = $latest.Version -replace '^(\d+\.\d+)b(\d+)$', '$1-b$2'
  $latest

}

update -ChecksumFor 64
