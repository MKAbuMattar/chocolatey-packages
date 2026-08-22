import-module Chocolatey-AU

$repo = 'microsoft/coreutils'

# Matched against the names the release actually carries. Upstream file names do not
# always track the tag, so the URL is never built by hand.
$assetPattern = 'coreutils-*-x64.exe'

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
  $version = $tag -replace '^v', ''

  $asset = $release.assets | Where-Object { $_.name -like $assetPattern } | Select-Object -First 1
  if (!$asset) { throw "No asset matching $assetPattern in release $tag" }

  @{
    Version      = $version
    URL64        = $asset.browser_download_url
    ReleaseNotes = "https://github.com/$repo/releases/tag/$tag"
  }
}

update -ChecksumFor 64
