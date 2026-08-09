import-module Chocolatey-AU

$repo = 'openinterpreter/openinterpreter'

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
  # openinterpreter/openinterpreter tags releases as 'rust-v<version>', and publishes other
  # components too, so take the newest tag carrying this prefix
  $releases = Invoke-RestMethod "https://api.github.com/repos/$repo/releases?per_page=100" -Headers $headers
  $tag = ($releases | Where-Object { $_.tag_name -like 'rust-v*' -and -not $_.prerelease } |
          Select-Object -First 1).tag_name
  if (!$tag) { throw 'No rust-v release found' }
  $version = $tag -replace '^rust-v', ''
  $asset = 'open-interpreter-package-x86_64-pc-windows-msvc.tar.gz'

  @{
    Version      = $version
    URL64        = "https://github.com/$repo/releases/download/$tag/$asset"
    ReleaseNotes = "https://github.com/$repo/releases/tag/$tag"
  }
}

update -ChecksumFor 64
