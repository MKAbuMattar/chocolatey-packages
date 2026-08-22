import-module Chocolatey-AU
Import-Module (Join-Path $PSScriptRoot '../../au_shared.psm1') -Global

$repo = 'ggml-org/whisper.cpp'

function global:au_SearchReplace { Get-AuSearchReplace }

function global:au_GetLatest {
  # whisper.cpp publishes semver releases such as v1.9.2 next to build tagged ones such as
  # b4938, and /releases/latest returns whichever went out last. b4938 is not a version
  # Chocolatey can order, which failed the run with "Invalid version: b4938". Some semver
  # releases are prereleases or carry no Windows build, so take the newest stable
  # v-prefixed release that actually ships the x64 zip.
  Get-GitHubLatest -Repo $repo -TagPattern '^v\d' -Asset 'whisper-bin-x64.zip' -RequireAsset
}

update -ChecksumFor 64
