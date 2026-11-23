import-module Chocolatey-AU
Import-Module (Join-Path $PSScriptRoot '../../au_shared.psm1') -Global

$repo = 'pyrefly-org/pyrefly'

function global:au_SearchReplace { Get-AuSearchReplace }

# Tags are bare x.y.z; the x.y.z-dev.N builds are marked pre-release.
function global:au_GetLatest {
  Get-GitHubLatest -Repo $repo -Asset 'pyrefly-windows-x86_64.zip'
}

update -ChecksumFor 64
