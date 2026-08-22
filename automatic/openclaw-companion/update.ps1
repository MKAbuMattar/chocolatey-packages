import-module Chocolatey-AU
Import-Module (Join-Path $PSScriptRoot '../../au_shared.psm1') -Global

$repo = 'openclaw/openclaw'

function global:au_SearchReplace { Get-AuSearchReplace }

function global:au_GetLatest {
  # Upstream sometimes publishes a release with no assets at all, and /releases/latest
  # happily returns it, which builds a download URL to a file that does not exist.
  # Take the newest release that actually carries the installer instead.
  Get-GitHubLatest -Repo $repo -Asset 'OpenClawCompanion-Setup-x64.exe' -RequireAsset
}

update -ChecksumFor 64
