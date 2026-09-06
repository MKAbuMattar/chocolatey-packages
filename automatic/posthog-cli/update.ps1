import-module Chocolatey-AU
Import-Module (Join-Path $PSScriptRoot '../../au_shared.psm1') -Global

$repo = 'PostHog/posthog'

function global:au_SearchReplace { Get-AuSearchReplace }

function global:au_GetLatest {
  # PostHog stopped publishing posthog-cli as GitHub releases: the repo now releases
  # only its desktop app and agent skills, dozens per week, and the newer
  # posthog-cli-v* tags carry no release at all, so neither /releases/latest nor a
  # prefix search can find a binary. The last release that actually shipped one is
  # this tag, pinned here by exact lookup, which /releases/tags reaches without
  # pagination. If upstream ever resumes releasing the CLI, replace this with a
  # Get-GitHubLatest -TagPrefix search again.
  $tag = 'posthog-cli/v0.9.2'
  $release = Invoke-RestMethod "https://api.github.com/repos/$repo/releases/tags/$([uri]::EscapeDataString($tag))" `
    -Headers (Get-GitHubHeaders)

  $latest = @{
    Version      = Get-VersionFromTag -Tag $tag -Prefix 'posthog-cli/'
    URL64        = (Get-GitHubMatchingAsset -Release $release -Pattern 'posthog-cli-x86_64-pc-windows-msvc.zip').browser_download_url
    ReleaseNotes = Get-GitHubReleaseNotesUrl -Repo $repo -Tag $tag
  }
  $latest
}

update -ChecksumFor 64
