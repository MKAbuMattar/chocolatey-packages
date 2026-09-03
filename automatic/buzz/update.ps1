import-module Chocolatey-AU
Import-Module (Join-Path $PSScriptRoot '../../au_shared.psm1') -Global

$repo = 'block/buzz'

function global:au_SearchReplace { Get-AuSearchReplace }

function global:au_GetLatest {
  # block/buzz publishes several components, and tags this one as 'desktop-v<version>',
  # so take the newest release carrying that prefix rather than whatever is latest.
  $latest = Get-GitHubLatest -Repo $repo -TagPrefix 'desktop-v' `
    -Asset 'Buzz_{version}_x64-setup_alpha-unsigned.exe'

  # The only Windows build upstream ships is named _alpha-unsigned, and has been for
  # every desktop release. A Chocolatey moderator rejected 0.5.9 for presenting that as
  # a stable version, so mark it as the prerelease it is. The suffix goes on after the
  # URL is built, because the asset name carries the bare upstream version.
  $latest.Version = "$($latest.Version)-alpha"
  $latest
}

update -ChecksumFor 64
