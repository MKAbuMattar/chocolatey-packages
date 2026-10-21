BeforeAll {
  Import-Module (Join-Path $PSScriptRoot '..' 'au_shared.psm1') -Force

  # The download has to exist, which is what failed: the URL was built for a release
  # that carried no such file.
  function Get-StatusCode {
    param([string]$Url)
    (Invoke-WebRequest $Url -Method Head -UseBasicParsing -MaximumRedirection 5).StatusCode
  }
}

# These call the real GitHub API. atom/atom is archived, so its releases never change:
# v1.60.0 is its latest, and AtomSetup-x64.msi was last attached to v1.18.0, 169
# releases down the list.
Describe 'Get-GitHubLatest against GitHub' -Tag 'Integration' {
  It 'picks the latest release when it carries the asset' {
    $latest = Get-GitHubLatest -Repo 'atom/atom' -Asset 'AtomSetup-x64.exe'
    $latest.Version | Should -Be '1.60.0'
    $latest.URL64 | Should -Be 'https://github.com/atom/atom/releases/download/v1.60.0/AtomSetup-x64.exe'
    Get-StatusCode $latest.URL64 | Should -Be 200
  }

  It 'falls back to the newest release carrying a named asset the latest lacks' {
    $latest = Get-GitHubLatest -Repo 'atom/atom' -Asset 'AtomSetup-x64.msi' -MaxPages 2 3>$null
    $latest.Version | Should -Be '1.18.0'
    $latest.URL64 | Should -Be 'https://github.com/atom/atom/releases/download/v1.18.0/AtomSetup-x64.msi'
    Get-StatusCode $latest.URL64 | Should -Be 200
  }

  It 'falls back the same way for an -AssetPattern' {
    $latest = Get-GitHubLatest -Repo 'atom/atom' -AssetPattern 'AtomSetup-x64.ms*' -MaxPages 2 3>$null
    $latest.Version | Should -Be '1.18.0'
    Get-StatusCode $latest.URL64 | Should -Be 200
  }

  # The case that failed: meshery published v1.0.72 with no assets, and the asset
  # name built from its tag was a 404. Whichever release this resolves to, its URL has
  # to download.
  It 'returns a downloadable URL for a templated -Asset on meshery' {
    $latest = Get-GitHubLatest -Repo 'meshery/meshery' -Asset 'mesheryctl_{version}_Windows_x86_64.zip' 3>$null
    $latest.URL64 | Should -Be "https://github.com/meshery/meshery/releases/download/v$($latest.Version)/mesheryctl_$($latest.Version)_Windows_x86_64.zip"
    Get-StatusCode $latest.URL64 | Should -Be 200
  }
}
