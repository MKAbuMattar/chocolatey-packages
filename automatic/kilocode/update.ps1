import-module Chocolatey-AU
Import-Module (Join-Path $PSScriptRoot '../../au_shared.psm1') -Global

$repo = 'Kilo-Org/kilocode'

function global:au_SearchReplace { Get-AuSearchReplace }

function global:au_GetLatest {
  # /releases/latest returns the jetbrains/vX.Y.Z tag, which ships no Windows zip, so
  # the built URL 404s. Take the newest v-prefixed release that actually carries it.
  Get-GitHubLatest -Repo $repo -TagPattern '^v\d' -Asset 'kilo-windows-x64.zip' -RequireAsset

}

update -ChecksumFor 64
