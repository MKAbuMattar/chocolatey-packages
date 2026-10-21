BeforeAll {
  Import-Module (Join-Path $PSScriptRoot '..' 'au_shared.psm1') -Force

  function New-Release {
    param([string]$Tag, [string[]]$Assets = @())
    [pscustomobject]@{
      tag_name   = $Tag
      prerelease = $false
      assets     = @($Assets | ForEach-Object {
          [pscustomobject]@{ name = $_; browser_download_url = "https://example.test/$Tag/$_" }
        })
    }
  }
}

Describe 'Get-GitHubLatest' {
  # meshery published v1.0.72 with no assets, and mesheryctl failed on a 404 for the
  # asset name built from that tag. The picked release has to carry the asset.
  Context 'the latest release has no Windows build' {
    BeforeAll {
      Mock -ModuleName au_shared Invoke-GitHubApi -ParameterFilter { $Url -like '*/releases/latest' } {
        New-Release -Tag 'v1.0.72'
      }
      Mock -ModuleName au_shared Invoke-GitHubApi -ParameterFilter { $Url -like '*/releases[?]*' } {
        New-Release -Tag 'v1.0.72'
        New-Release -Tag 'v1.0.71' -Assets 'tool_1.0.71_Windows_x86_64.zip'
      }
      Mock -ModuleName au_shared Write-Warning {}
    }

    It 'falls back to the newest release with a templated -Asset' {
      $latest = Get-GitHubLatest -Repo 'o/r' -Asset 'tool_{version}_Windows_x86_64.zip'
      $latest.Version | Should -Be '1.0.71'
      $latest.URL64 | Should -Be 'https://github.com/o/r/releases/download/v1.0.71/tool_1.0.71_Windows_x86_64.zip'
    }

    It 'falls back to the newest release with an -AssetPattern' {
      $latest = Get-GitHubLatest -Repo 'o/r' -AssetPattern 'tool_*_Windows_x86_64.zip'
      $latest.Version | Should -Be '1.0.71'
      $latest.URL64 | Should -Be 'https://example.test/v1.0.71/tool_1.0.71_Windows_x86_64.zip'
    }
  }

  Context 'the latest release has the Windows build' {
    BeforeAll {
      Mock -ModuleName au_shared Invoke-GitHubApi -ParameterFilter { $Url -like '*/releases/latest' } {
        New-Release -Tag 'v2.0.0' -Assets 'tool_2.0.0_Windows_x86_64.zip'
      }
      Mock -ModuleName au_shared Invoke-GitHubApi -ParameterFilter { $Url -like '*/releases[?]*' } {
        throw 'the release list must not be read when the latest release has the asset'
      }
    }

    It 'picks it, as before' {
      $latest = Get-GitHubLatest -Repo 'o/r' -Asset 'tool_{version}_Windows_x86_64.zip'
      $latest.Version | Should -Be '2.0.0'
    }
  }
}
