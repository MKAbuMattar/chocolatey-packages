BeforeAll {
  $updateScript = Join-Path $TestDrive 'update_all.ps1'
  $syncScript = Join-Path $TestDrive 'sync_readme.ps1'
  Copy-Item (Join-Path $PSScriptRoot '..' 'update_all.ps1') $updateScript
  Copy-Item (Join-Path $PSScriptRoot '..' 'sync_readme.ps1') $syncScript
  $script:OriginalAuPush = [Environment]::GetEnvironmentVariable(
    'au_Push',
    'Process'
  )
  $script:OriginalGithubApiKey = [Environment]::GetEnvironmentVariable(
    'github_api_key',
    'Process'
  )
  $script:OriginalGithubUserRepo = [Environment]::GetEnvironmentVariable(
    'github_user_repo',
    'Process'
  )
  $script:OriginalAuRoot = Get-Variable -Name au_Root -Scope Global `
    -ErrorAction SilentlyContinue
  $script:OriginalAuWhatIf = Get-Variable -Name au_WhatIf -Scope Global `
    -ErrorAction SilentlyContinue
  $script:CapturedOptions = $null

  function New-UpdateFixture {
    $dir = Join-Path $TestDrive 'automatic/tailspin'
    New-Item $dir -ItemType Directory -Force | Out-Null
    $nuspec = @'
<package>
  <metadata>
    <id>tailspin</id>
    <version>1.0.0</version>
    <description><![CDATA[
fixture
]]></description>
  </metadata>
</package>
'@
    Set-Content -LiteralPath (Join-Path $dir 'tailspin.nuspec') `
      -Value $nuspec -NoNewline
    Set-Content -LiteralPath (Join-Path $dir 'README.md') `
      -Value "# Tailspin Chocolatey Package`n`nfixture" -NoNewline
    Set-Content -LiteralPath (Join-Path $dir 'update.ps1') `
      -Value '$null' -NoNewline
  }

  function updateall {
    param([string[]]$Name, [hashtable]$Options)
    [pscustomobject]@{
      Name = 'tailspin'
      Options = $Options
    }
  }

  function Invoke-Update {
    param(
      [switch]$Force,
      [string]$Push = 'true',
      [switch]$LocalSecrets
    )
    $script:CapturedOptions = $null
    New-UpdateFixture
    $env:au_Push = $Push
    $env:github_api_key = 'github-secret'
    $env:github_user_repo = 'owner/repository'
    $varsPath = Join-Path $TestDrive 'update_vars.ps1'
    Remove-Item $varsPath -ErrorAction SilentlyContinue
    if ($LocalSecrets) {
      Set-Content -LiteralPath $varsPath `
        -Value '$Env:github_user_repo = "local/repository"' -NoNewline
    }
    $params = @{}
    if ($Force) { $params.Force = $true }
    (& $updateScript @params) *>&1 | Out-String
    $script:CapturedOptions = @($global:info)[0].Options
    Remove-Variable -Name info -Scope Global -ErrorAction SilentlyContinue
  }

  function New-UpdateHarness {
    param([ValidateSet('failure', 'ignored-only')][string]$Mode)
    $harness = Join-Path $TestDrive "update-$Mode.ps1"
    @"
param([string]`$ScriptPath, [string]`$Mode)
`$result = if (`$Mode -eq 'failure') {
  @(
    [pscustomobject]@{ Name = 'ignored'; Error = 'already exists'; Ignored = `$true }
    [pscustomobject]@{ Name = 'broken'; Error = 'network failed'; Ignored = `$false }
  )
} else {
  @([pscustomobject]@{ Name = 'ignored'; Error = 'already exists'; Ignored = `$true })
}
function updateall {
  param([string[]]`$Name, [hashtable]`$Options)
  `$result
}
& `$ScriptPath
exit `$LASTEXITCODE
"@ | Set-Content $harness
    $harness
  }

  function Restore-EnvironmentValue {
    param([string]$Name, [AllowNull()][string]$Value)
    if ($null -eq $Value) {
      Remove-Item "Env:$Name" -ErrorAction SilentlyContinue
    } else {
      Set-Item "Env:$Name" $Value
    }
  }
}

AfterAll {
  Restore-EnvironmentValue -Name au_Push -Value $script:OriginalAuPush
  Restore-EnvironmentValue -Name github_api_key -Value $script:OriginalGithubApiKey
  Restore-EnvironmentValue -Name github_user_repo -Value $script:OriginalGithubUserRepo
  if ($null -eq $script:OriginalAuRoot) {
    Remove-Variable -Name au_Root -Scope Global -ErrorAction SilentlyContinue
  } else {
    Set-Variable -Name au_Root -Scope Global -Value $script:OriginalAuRoot.Value
  }
  if ($null -eq $script:OriginalAuWhatIf) {
    Remove-Variable -Name au_WhatIf -Scope Global -ErrorAction SilentlyContinue
  } else {
    Set-Variable -Name au_WhatIf -Scope Global -Value $script:OriginalAuWhatIf.Value
  }
}

Describe 'update_all.ps1' {
  BeforeEach {
    $env:au_Push = 'true'
    $env:github_api_key = 'github-secret'
    $env:github_user_repo = 'owner/repository'
  }

  It 'disables Push when Force is passed even if au_Push is true' {
    Invoke-Update -Force | Out-Null

    $script:CapturedOptions.Force | Should -BeTrue
    $script:CapturedOptions.Push | Should -BeFalse
  }

  It 'enables Push only when au_Push is true without Force' {
    Invoke-Update | Out-Null

    $script:CapturedOptions.Force | Should -BeFalse
    $script:CapturedOptions.Push | Should -BeTrue
  }

  It 'disables Push when au_Push is not true' {
    Invoke-Update -Push 'false' | Out-Null

    $script:CapturedOptions.Force | Should -BeFalse
    $script:CapturedOptions.Push | Should -BeFalse
  }

  It 'passes report, Git, and release options through' {
    Invoke-Update -Force | Out-Null

    $script:CapturedOptions.Report.Params.Github_UserRepo |
      Should -Be 'owner/repository'
    $script:CapturedOptions.Git.Password | Should -Be 'github-secret'
    $script:CapturedOptions.GitReleases.ApiToken | Should -Be 'github-secret'
  }

  It 'sets au_Root to the fixture automatic directory' {
    Invoke-Update -Force | Out-Null

    $global:au_Root | Should -Be (Join-Path $TestDrive 'automatic')
  }

  It 'loads local secrets before building the options' {
    Invoke-Update -LocalSecrets | Out-Null

    $script:CapturedOptions.Report.Params.Github_UserRepo |
      Should -Be 'local/repository'
  }

  It 'fails only for non-ignored package errors' {
    New-UpdateFixture
    $env:au_Push = 'false'
    $harness = New-UpdateHarness -Mode failure
    $output = (& (Join-Path $PSHOME 'pwsh') -NoProfile -File $harness `
      -ScriptPath $updateScript -Mode failure) *>&1 |
      Out-String

    $LASTEXITCODE | Should -Be 1
    $output | Should -Match '::error::1 package\(s\) failed: broken'
    $output | Should -Not -Match '::error::.*ignored'
  }

  It 'succeeds when every package error is ignored' {
    New-UpdateFixture
    $env:au_Push = 'false'
    $harness = New-UpdateHarness -Mode ignored-only
    $output = (& (Join-Path $PSHOME 'pwsh') -NoProfile -File $harness `
      -ScriptPath $updateScript -Mode ignored-only) *>&1 |
      Out-String

    $LASTEXITCODE | Should -Be 0
    $output | Should -Not -Match '::error::'
  }
}
