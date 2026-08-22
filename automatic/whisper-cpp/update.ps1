import-module Chocolatey-AU

$repo = 'ggml-org/whisper.cpp'

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
  $asset = 'whisper-bin-x64.zip'

  # whisper.cpp publishes semver releases such as v1.9.2 next to build tagged ones such as
  # b4938, and /releases/latest returns whichever went out last. b4938 is not a version
  # Chocolatey can order, which failed the run with "Invalid version: b4938". Some semver
  # releases are prereleases or carry no Windows build, so take the newest stable
  # v-prefixed release that actually ships the x64 zip.
  $releases = Invoke-RestMethod "https://api.github.com/repos/$repo/releases?per_page=100" -Headers $headers
  $release = $releases | Where-Object {
    $_.tag_name -match '^v\d' -and -not $_.prerelease -and ($_.assets.name -contains $asset)
  } | Select-Object -First 1
  if (!$release) { throw "No stable v-tagged release carrying $asset" }

  $tag = $release.tag_name
  $version = $tag -replace '^v', ''

  @{
    Version      = $version
    URL64        = "https://github.com/$repo/releases/download/$tag/$asset"
    ReleaseNotes = "https://github.com/$repo/releases/tag/$tag"
  }
}

update -ChecksumFor 64
