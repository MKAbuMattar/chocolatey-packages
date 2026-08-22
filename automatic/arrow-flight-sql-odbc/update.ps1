import-module Chocolatey-AU
Import-Module (Join-Path $PSScriptRoot '../../au_shared.psm1') -Global

$repo = 'apache/arrow'

function global:au_SearchReplace { Get-AuSearchReplace }

function global:au_GetLatest {
  # apache/arrow publishes several components, and tags this one as 'apache-arrow-<version>',
  # so take the newest release carrying that prefix rather than whatever is latest.
  Get-GitHubLatest -Repo $repo -TagPrefix 'apache-arrow-' `
    -Asset 'Apache-Arrow-Flight-SQL-ODBC-{version}-win64.msi'
}

update -ChecksumFor 64
