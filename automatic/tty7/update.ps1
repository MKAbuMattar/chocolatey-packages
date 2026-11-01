import-module Chocolatey-AU
Import-Module (Join-Path $PSScriptRoot '../../au_shared.psm1') -Global

$repo = 'l0ng-ai/tty7'

function global:au_SearchReplace { Get-AuSearchReplace }

# The repo also publishes 'nightly' and 'mobile-v*' (Android) releases, so only v<digit>.
function global:au_GetLatest {
  Get-GitHubLatest -Repo $repo -TagPattern '^v\d' -Asset 'tty7-{version}-windows-x86_64-setup.exe' -RequireAsset
}

update -ChecksumFor 64
