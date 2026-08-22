import-module Chocolatey-AU

$repo = 'cloudnative-pg/cloudnative-pg'

function global:au_SearchReplace {
  @{
    'tools\chocolateyInstall.ps1' = @{
      "(^\s*url64\s*=\s*)('.*')"      = "`$1'$($Latest.URL64)'"
      "(^\s*checksum64\s*=\s*)('.*')" = "`$1'$($Latest.Checksum64)'"
    }
    "$($Latest.PackageName).nuspec" = @{
      "(<releaseNotes>).*(</releaseNotes>)" = "`${1}$($Latest.ReleaseNotes)`$2"
    }
  }
}

function global:au_GetLatest {
  $headers = if ($Env:github_api_key) { @{ Authorization = "token $Env:github_api_key" } } else { @{} }
  $release = Invoke-RestMethod "https://api.github.com/repos/$repo/releases/latest" -Headers $headers
  $tag = $release.tag_name
  if (!$tag) { throw "The latest release of $repo carries no tag_name" }
  $version = $tag -replace '^v', ''
  $asset = "kubectl-cnpg_${version}_windows_x86_64.tar.gz"

  # /releases/latest also returns a release that never shipped this file, and a URL built
  # for a missing asset only surfaces later as a checksum download failure naming no cause.
  if ($release.assets.name -notcontains $asset) {
    throw "Release $tag of $repo carries no asset named $asset. It carries: $($release.assets.name -join ', ')"
  }

  @{
    Version      = $version
    URL64        = "https://github.com/$repo/releases/download/$tag/$asset"
    ReleaseNotes = "https://github.com/$repo/releases/tag/$tag"
  }
}

update -ChecksumFor 64
