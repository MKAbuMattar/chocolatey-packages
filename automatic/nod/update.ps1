import-module Chocolatey-AU
Import-Module (Join-Path $PSScriptRoot '../../au_shared.psm1') -Global

$repo = 'n8n-io/nod'

function global:au_SearchReplace { Get-AuSearchReplace }

# Tags are nod-v<version>; the installer name carries no version.
function global:au_GetLatest {
  Get-GitHubLatest -Repo $repo -TagPrefix 'nod-v' -Asset 'nod-Setup-x64.exe'
}

update -ChecksumFor 64
