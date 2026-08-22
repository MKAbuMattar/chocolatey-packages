BeforeAll {
  $updateScript = Join-Path $TestDrive 'update_all.ps1'
  $syncScript = Join-Path $TestDrive 'sync_readme.ps1'
  Copy-Item (Join-Path $PSScriptRoot '..' 'update_all.ps1') $updateScript
  Copy-Item (Join-Path $PSScriptRoot '..' 'sync_readme.ps1') $syncScript
  $global:CapturedOptions = $null
  $global:UpdateResult = @()

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
    $global:CapturedOptions = $Options
    $global:UpdateResult
  }

  function Invoke-Update {
    param([switch]$Force)
    $global:CapturedOptions = $null
    $global:UpdateResult = @([pscustomobject]@{ Name = 'tailspin' })
    New-UpdateFixture
    $env:au_Push = 'true'
    $env:github_api_key = 'github-secret'
    $env:github_user_repo = 'owner/repository'
    $params = @{}
    if ($Force) { $params.Force = $true }
    (& $updateScript @params) *>&1 | Out-String
  }

  function New-UpdateHarness {
    param([string]$Mode)
    $harness = Join-Path $TestDrive "update-$Mode.ps1"
    @"
param([string]`$ScriptPath, [string]`$Mode)
`$result = if (`$Mode -eq 'failure') {
  @(
    [pscustomobject]@{ Name = 'ignored'; Error = 'already exists'; Ignored = `$true }
    [pscustomobject]@{ Name = 'broken'; Error = 'network failed'; Ignored = `$false }
  )
} else {
  @([pscustomobject]@{ Name = 'tailspin' })
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
}

Describe 'update_all.ps1' {
  BeforeEach {
    $env:au_Push = 'true'
    $env:github_api_key = 'github-secret'
    $env:github_user_repo = 'owner/repository'
  }

  It 'disables Push when Force is passed even if au_Push is true' {
    Invoke-Update -Force | Out-Null

    $global:CapturedOptions.Force | Should -BeTrue
    $global:CapturedOptions.Push | Should -BeFalse
  }

  It 'enables Push only when au_Push is true without Force' {
    Invoke-Update | Out-Null

    $global:CapturedOptions.Force | Should -BeFalse
    $global:CapturedOptions.Push | Should -BeTrue
  }

  It 'passes the force and report, Git, and release options through' {
    Invoke-Update -Force | Out-Null

    $global:CapturedOptions.Force | Should -BeTrue
    $global:CapturedOptions.Report.Params.Github_UserRepo | Should -Be 'owner/repository'
    $global:CapturedOptions.Git.Password | Should -Be 'github-secret'
    $global:CapturedOptions.GitReleases.ApiToken | Should -Be 'github-secret'
  }

  It 'does not fail for an ignored error but fails for a real error' {
    New-UpdateFixture
    $env:au_Push = 'false'
    $harness = New-UpdateHarness -Mode failure
    $output = (& (Join-Path $PSHOME 'pwsh') -NoProfile -File $harness `
      -ScriptPath $updateScript -Mode failure) *>&1 | Out-String

    $LASTEXITCODE | Should -Be 1
    $output | Should -Match '::error::1 package\(s\) failed: broken'
    $output | Should -Not -Match 'ignored'
  }
}
