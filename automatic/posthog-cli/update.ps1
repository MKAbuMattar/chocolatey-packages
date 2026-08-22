import-module Chocolatey-AU
Import-Module (Join-Path $PSScriptRoot '../../au_shared.psm1') -Global

$repo = 'PostHog/posthog'

function global:au_SearchReplace { Get-AuSearchReplace }

function global:au_GetLatest {
  # PostHog/posthog is a monorepo and its latest release is often another component,
  # so take the newest tag carrying this tool's prefix
  Get-GitHubLatest -Repo $repo -TagPrefix 'posthog-cli/' `
    -Asset 'posthog-cli-x86_64-pc-windows-msvc.zip'
}

update -ChecksumFor 64
