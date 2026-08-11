import-module Chocolatey-AU

$repo = 'block/buzz'

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
  # block/buzz publishes several components, and tags this one as 'desktop-v<version>',
  # so take the newest release carrying that prefix rather than whatever is latest.
  $releases = Invoke-RestMethod "https://api.github.com/repos/$repo/releases?per_page=100" -Headers $headers
  $tag = ($releases | Where-Object { $_.tag_name -like 'desktop-v*' -and -not $_.prerelease } |
          Select-Object -First 1).tag_name
  if (!$tag) { throw 'No desktop-v release found' }
  $version = $tag -replace '^desktop-v', '' -replace '^v', ''
  $asset = "Buzz_${version}_x64-setup_alpha-unsigned.exe"

  @{
    Version      = $version
    URL64        = "https://github.com/$repo/releases/download/$tag/$asset"
    ReleaseNotes = "https://github.com/$repo/releases/tag/$tag"
  }
}

update -ChecksumFor 64
