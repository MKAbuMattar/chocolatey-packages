import-module Chocolatey-AU

$repo = 'openclaw/openclaw'

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
  $asset = 'OpenClawCompanion-Setup-x64.exe'

  # Upstream sometimes publishes a release with no assets at all, and /releases/latest
  # happily returns it, which builds a download URL to a file that does not exist.
  # Take the newest release that actually carries the installer instead.
  $releases = Invoke-RestMethod "https://api.github.com/repos/$repo/releases?per_page=50" -Headers $headers
  $release = $releases | Where-Object { -not $_.prerelease -and ($_.assets.name -contains $asset) } |
             Select-Object -First 1
  if (!$release) { throw "No release published with $asset" }
  $tag = $release.tag_name
  $version = $tag -replace '^v', ''

  @{
    Version      = $version
    URL64        = "https://github.com/$repo/releases/download/$tag/$asset"
    ReleaseNotes = "https://github.com/$repo/releases/tag/$tag"
  }
}

update -ChecksumFor 64
