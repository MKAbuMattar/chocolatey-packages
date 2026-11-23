import-module Chocolatey-AU
Import-Module (Join-Path $PSScriptRoot '../../au_shared.psm1') -Global

$repo = 'siderolabs/omni'

function global:au_SearchReplace { Get-AuSearchReplace }

# Upstream publishes betas (v1.14.0-beta.0) as full releases, so only plain x.y.z tags.
function global:au_GetLatest {
  Get-GitHubLatest -Repo $repo -TagPattern '^v\d+\.\d+\.\d+$' -Asset 'omnictl-windows-amd64.exe'
}

update -ChecksumFor 64
