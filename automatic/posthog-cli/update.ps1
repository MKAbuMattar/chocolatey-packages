import-module Chocolatey-AU
Import-Module (Join-Path $PSScriptRoot '../../au_shared.psm1') -Global

$repo = 'PostHog/posthog'
$asset = 'posthog-cli-x86_64-pc-windows-msvc.zip'

function global:au_SearchReplace { Get-AuSearchReplace }

function global:au_GetLatest {
  # PostHog is a monorepo that publishes hundreds of releases a week for its other
  # components. Paging through /releases for the CLI kept falling behind: by October
  # its newest release sat 530 deep, past the 500 a five-page search reads, and the
  # gap only grows. Ask for the CLI's own tags instead. matching-refs returns every
  # posthog-cli/ tag in one call (65 of them), so the cost no longer depends on how
  # busy the rest of the repository is.
  $tags = Invoke-GitHubApi "https://api.github.com/repos/$repo/git/matching-refs/tags/posthog-cli/v"
  $versions = $tags | ForEach-Object { $_.ref -replace '^refs/tags/posthog-cli/v', '' } |
    Where-Object { $_ -match '^\d+(\.\d+){1,3}$' } | Sort-Object { [version]$_ } -Descending

  # The newest tag can predate its release or lack the Windows build, so take the
  # newest one whose release is stable and actually carries the zip.
  foreach ($version in $versions) {
    $tag = "posthog-cli/v$version"
    $release = try { Invoke-GitHubApi "https://api.github.com/repos/$repo/releases/tags/$tag" } catch { $null }
    if ($release -and -not $release.prerelease -and ($release.assets.name -contains $asset)) {
      return @{
        Version      = $version
        URL64        = Get-GitHubAssetUrl -Repo $repo -Tag $tag -Asset $asset
        ReleaseNotes = Get-GitHubReleaseNotesUrl -Repo $repo -Tag $tag
      }
    }
  }
  throw "No posthog-cli release of $repo carries $asset"
}

update -ChecksumFor 64
