import-module Chocolatey-AU

$repo = 'apache/arrow'

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
  # apache/arrow publishes several components, and tags this one as 'apache-arrow-<version>',
  # so take the newest release carrying that prefix rather than whatever is latest.
  $releases = Invoke-RestMethod "https://api.github.com/repos/$repo/releases?per_page=100" -Headers $headers
  $tag = ($releases | Where-Object { $_.tag_name -like 'apache-arrow-*' -and -not $_.prerelease } |
          Select-Object -First 1).tag_name
  if (!$tag) { throw 'No apache-arrow- release found' }
  $version = $tag -replace '^apache-arrow-', '' -replace '^v', ''
  $asset = "Apache-Arrow-Flight-SQL-ODBC-${version}-win64.msi"

  @{
    Version      = $version
    URL64        = "https://github.com/$repo/releases/download/$tag/$asset"
    ReleaseNotes = "https://github.com/$repo/releases/tag/$tag"
  }
}

update -ChecksumFor 64
