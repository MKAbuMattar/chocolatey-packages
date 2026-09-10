import-module Chocolatey-AU
Import-Module (Join-Path $PSScriptRoot '../../au_shared.psm1') -Global

$repo = 'r14dd/patent'

function global:au_SearchReplace { Get-AuSearchReplace }

function global:au_GetLatest {
  # Windows is new here. v0.14.0 is the first release to carry a Windows zip at all,
  # and v0.13.1, v0.13.0 and v0.12.0 before it shipped macOS only. -RequireAsset keeps
  # the package on the newest release that actually has a Windows build instead of
  # following the tag onto a release with nothing to install.
  Get-GitHubLatest -Repo $repo -Asset 'patent-x86_64-pc-windows-msvc.zip' -RequireAsset
}

update -ChecksumFor 64
