import-module Chocolatey-AU
Import-Module (Join-Path $PSScriptRoot '../../au_shared.psm1') -Global

$repo = 'Untrivial-ai/agent-orchestrator'

function global:au_SearchReplace { Get-AuSearchReplace }

function global:au_GetLatest {
  Get-GitHubLatest -Repo $repo -Asset 'Agent.Orchestrator.Setup.{version}.exe'
}

update -ChecksumFor 64
