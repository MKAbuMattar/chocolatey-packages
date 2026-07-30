import-module Chocolatey-AU

$repo = 'PostHog/posthog'

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
  # PostHog/posthog is a monorepo and its latest release is often another component,
  # so take the newest tag carrying this tool's prefix
  $releases = Invoke-RestMethod "https://api.github.com/repos/$repo/releases?per_page=100" -Headers $headers
  $tag = ($releases | Where-Object { $_.tag_name -like 'posthog-cli/*' -and -not $_.prerelease } |
          Select-Object -First 1).tag_name
  if (!$tag) { throw 'No posthog-cli/ release found' }
  $version = ($tag -split '/')[-1] -replace '^v', ''
  $asset = 'posthog-cli-x86_64-pc-windows-msvc.zip'

  @{
    Version      = $version
    URL64        = "https://github.com/$repo/releases/download/$tag/$asset"
    ReleaseNotes = "https://github.com/$repo/releases/tag/$tag"
  }
}

update -ChecksumFor 64
