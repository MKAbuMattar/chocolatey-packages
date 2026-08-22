import-module Chocolatey-AU

$repo = 'novincode/dlman'

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

  # The asset name cannot be built from the tag. Upstream shipped v1.12.0 with every file
  # still named 1.11.1, a different build to v1.11.1 despite the name, so a constructed
  # URL 404s. Take whichever x64 MSI the release actually carries.
  $asset = $release.assets | Where-Object { $_.name -like '*_x64_en-US.msi' } | Select-Object -First 1
  if (!$asset) { throw "No x64 en-US MSI in release $tag" }

  @{
    Version      = $version
    URL64        = $asset.browser_download_url
    ReleaseNotes = "https://github.com/$repo/releases/tag/$tag"
  }
}

update -ChecksumFor 64
