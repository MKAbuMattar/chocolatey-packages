import-module Chocolatey-AU
Import-Module (Join-Path $PSScriptRoot '../../au_shared.psm1') -Global

$repo = 'PostHog/posthog'

function global:au_SearchReplace { Get-AuSearchReplace }

function global:au_GetLatest {
  # PostHog is a monorepo that publishes dozens of releases a week for its other
  # components, which pushes posthog-cli past the first page of /releases. That is why
  # a single-page prefix search started failing with "not in the last 100 releases",
  # and why this was previously pinned to v0.9.2 on the belief that upstream had
  # stopped shipping the CLI. It has not: v0.18.1 carries the Windows zip. Search
  # deeper instead of pinning, so the package keeps following upstream.
  Get-GitHubLatest -Repo $repo -TagPrefix 'posthog-cli/' `
    -Asset 'posthog-cli-x86_64-pc-windows-msvc.zip' -RequireAsset -MaxPages 5
}
update -ChecksumFor 64
