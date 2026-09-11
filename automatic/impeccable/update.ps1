import-module Chocolatey-AU
Import-Module (Join-Path $PSScriptRoot '../../au_shared.psm1') -Global

$repo = 'pbakaus/impeccable'

function global:au_SearchReplace { Get-AuSearchReplace }

function global:au_GetLatest {
  # Two components share this repository. skill-v<version> is the design skill itself and
  # ships no binary; engine-v<version> ships the engine the skill runs. /releases/latest
  # returns whichever went out last, which is usually a skill tag, so filter to the
  # engine and take its version. -TagPrefix also strips 'engine-' from the version.
  Get-GitHubLatest -Repo $repo -TagPrefix 'engine-' `
    -Asset 'impeccable-windows-x64.exe' -RequireAsset
}

update -ChecksumFor 64
