import-module Chocolatey-AU
Import-Module (Join-Path $PSScriptRoot '../../au_shared.psm1') -Global

$repo = 'boykopovar/AnyPS5'

# Two downloads from one release: the shared map rewrites url64 and checksum64, which
# here are the relinker's; the libraries zip's pair lives in its own variables.
function global:au_SearchReplace {
  $map = Get-AuSearchReplace
  $map['tools\chocolateyInstall.ps1']["(^\s*\`$librariesUrl\s*=\s*)('.*')"] = "`$1'$($Latest.URLLibs)'"
  $map['tools\chocolateyInstall.ps1']["(^\s*\`$librariesChecksum\s*=\s*)('.*')"] = "`$1'$($Latest.ChecksumLibs)'"
  $map
}

# AU only checksums URL64, and this runs only when a new version is being packaged, so
# the 10 MB libraries zip is not downloaded on every scheduled run.
function global:au_BeforeUpdate { $Latest.ChecksumLibs = Get-RemoteChecksum $Latest.URLLibs }

function global:au_GetLatest {
  $latest = Get-GitHubLatest -Repo $repo -AssetPattern 'relinker-v*.exe'
  $tag = "v$($latest.Version)"
  $latest.URLLibs = Get-GitHubAssetUrl -Repo $repo -Tag $tag -Asset "prx-windows-$tag.zip"
  $latest
}

update -ChecksumFor 64
