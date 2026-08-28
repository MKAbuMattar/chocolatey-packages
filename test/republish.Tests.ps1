BeforeAll {
  Add-Type -AssemblyName System.IO.Compression.FileSystem
  $republishScript = Join-Path $TestDrive 'republish.ps1'
  Copy-Item (Join-Path $PSScriptRoot '..' 'republish.ps1') $republishScript
  $chocoStub = Join-Path $PSScriptRoot 'fixtures/choco-stub.ps1'
  $script:ChocoLogPath = Join-Path $TestDrive 'choco.log'
  $script:OriginalChocoMode = [Environment]::GetEnvironmentVariable(
    'CHOCO_STUB_MODE',
    'Process'
  )
  $script:OriginalChocoFailingPackage = [Environment]::GetEnvironmentVariable(
    'CHOCO_STUB_FAILING_PACKAGE',
    'Process'
  )
  $script:OriginalChocoLogPath = [Environment]::GetEnvironmentVariable(
    'CHOCO_STUB_LOG_PATH',
    'Process'
  )
  $script:OriginalApiKey = [Environment]::GetEnvironmentVariable(
    'api_key',
    'Process'
  )
  . $chocoStub

  function New-RepublishPackage {
    param([string]$Name, [string]$Version = '1.2.3')
    $dir = Join-Path $TestDrive "automatic/$Name"
    New-Item $dir -ItemType Directory -Force | Out-Null
    $nuspec = "<package><metadata><id>$Name</id><version>$Version</version></metadata></package>"
    Set-Content -LiteralPath (Join-Path $dir "$Name.nuspec") `
      -Value $nuspec -NoNewline
    $dir
  }

  function Invoke-Republish {
    param([string[]]$Name, [switch]$WhatIf)
    Set-Content -LiteralPath $script:ChocoLogPath -Value '' -NoNewline
    $env:CHOCO_STUB_MODE = 'clean'
    $env:CHOCO_STUB_FAILING_PACKAGE = ''
    $env:CHOCO_STUB_LOG_PATH = $script:ChocoLogPath
    $env:api_key = 'fixture-api-key'
    $params = @{ Name = $Name }
    if ($WhatIf) { $params.WhatIf = $true }
    (& $republishScript @params) *>&1 | Out-String
  }

  function New-RepublishHarness {
    param(
      [ValidateSet('clean', 'binary', 'tarball')][string]$Mode,
      [string]$FailingPackage
    )
    $harness = Join-Path $TestDrive "republish-$Mode.ps1"
    @"
param(
  [string]`$ScriptPath,
  [string]`$StubPath,
  [string[]]`$Name,
  [string]`$Mode,
  [string]`$FailingPackage,
  [string]`$LogPath,
  [switch]`$WhatIf
)
`$Name = `$Name -split ','
Add-Type -AssemblyName System.IO.Compression.FileSystem
`$env:api_key = 'fixture-api-key'
`$env:CHOCO_STUB_MODE = `$Mode
`$env:CHOCO_STUB_FAILING_PACKAGE = `$FailingPackage
`$env:CHOCO_STUB_LOG_PATH = `$LogPath
. `$StubPath
`$params = @{ Name = `$Name }
if (`$WhatIf) { `$params.WhatIf = `$true }
& `$ScriptPath @params
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
  Restore-EnvironmentValue -Name api_key -Value $script:OriginalApiKey
  Restore-EnvironmentValue -Name CHOCO_STUB_MODE -Value $script:OriginalChocoMode
  Restore-EnvironmentValue -Name CHOCO_STUB_FAILING_PACKAGE `
    -Value $script:OriginalChocoFailingPackage
  Restore-EnvironmentValue -Name CHOCO_STUB_LOG_PATH -Value $script:OriginalChocoLogPath
}

Describe 'republish.ps1' {
  BeforeEach {
    Set-Content -LiteralPath $script:ChocoLogPath -Value '' -NoNewline
    $env:CHOCO_STUB_MODE = 'clean'
    $env:CHOCO_STUB_FAILING_PACKAGE = ''
    $env:CHOCO_STUB_LOG_PATH = $script:ChocoLogPath
    $env:api_key = 'fixture-api-key'
  }

  It 'reads the version from the nuspec and packs the package' {
    New-RepublishPackage -Name alpha -Version '4.5.6' | Out-Null

    $output = Invoke-Republish -Name alpha

    $output | Should -Match 'alpha 4.5.6'
    $logLines = @(Get-Content $script:ChocoLogPath)
    $logLines.Count | Should -Be 2
    $logLines[0] | Should -Match '^pack '
    $logLines[1] | Should -Match '^push '
  }

  It 'packs but never pushes in WhatIf mode and does not require an api key' {
    New-RepublishPackage -Name dry-run | Out-Null
    Remove-Item Env:api_key -ErrorAction SilentlyContinue

    $output = Invoke-Republish -Name dry-run -WhatIf

    $output | Should -Match 'WhatIf: would push dry-run'
    $logLines = @(Get-Content $script:ChocoLogPath)
    @($logLines | Where-Object { $_ -match '^pack ' }).Count | Should -Be 1
    @($logLines | Where-Object { $_ -match '^push ' }).Count | Should -Be 0
  }

  It 'throws when api_key is missing without WhatIf' {
    New-RepublishPackage -Name protected | Out-Null
    Remove-Item Env:api_key -ErrorAction SilentlyContinue

    { & $republishScript -Name protected } | Should -Throw '*api_key is not set*'
  }

  It 'reads api_key from update_vars.ps1 when it exists' {
    New-RepublishPackage -Name local-secrets | Out-Null
    Remove-Item Env:api_key -ErrorAction SilentlyContinue
    $varsPath = Join-Path $TestDrive 'update_vars.ps1'
    Set-Content -LiteralPath $varsPath -Value '$Env:api_key = "local-secret"' -NoNewline

    try {
      Invoke-Republish -Name local-secrets

      $push = @(Get-Content $script:ChocoLogPath |
        Where-Object { $_ -match '^push ' })[0]
      $push | Should -Match '--api-key local-secret'
    }
    finally {
      Remove-Item $varsPath -ErrorAction SilentlyContinue
    }
  }

  It 'reports an unknown package as failed' {
    $harness = New-RepublishHarness -Mode clean
    $log = Join-Path $TestDrive 'unknown.log'
    $output = (& (Join-Path $PSHOME 'pwsh') -NoProfile -File $harness `
      -ScriptPath $republishScript -StubPath $chocoStub -Name unknown `
      -Mode clean -LogPath $log) *>&1 | Out-String

    $LASTEXITCODE | Should -Be 1
    $output | Should -Match 'unknown is not a package'
    $output | Should -Match 'failed: unknown'
  }

  It 'continues after a pack failure and pushes healthy packages' {
    New-RepublishPackage -Name broken | Out-Null
    New-RepublishPackage -Name healthy | Out-Null
    $harness = New-RepublishHarness -Mode clean -FailingPackage broken
    $log = Join-Path $TestDrive 'pack-failure.log'
    $output = (& (Join-Path $PSHOME 'pwsh') -NoProfile -File $harness `
      -ScriptPath $republishScript -StubPath $chocoStub `
      -Name broken,healthy -Mode clean -FailingPackage broken `
      -LogPath $log) *>&1 | Out-String

    $LASTEXITCODE | Should -Be 1
    $output | Should -Match 'broken pack failed'
    $output | Should -Not -Match 'healthy pack failed'
    $logLines = @(Get-Content $log)
    @($logLines | Where-Object { $_ -match '^push .*healthy\.' }).Count |
      Should -Be 1
  }

  It 'rejects binary entries without pushing' {
    New-RepublishPackage -Name binary | Out-Null
    $harness = New-RepublishHarness -Mode binary
    $log = Join-Path $TestDrive 'binary.log'
    $output = (& (Join-Path $PSHOME 'pwsh') -NoProfile -File $harness `
      -ScriptPath $republishScript -StubPath $chocoStub -Name binary `
      -Mode binary -LogPath $log) *>&1 | Out-String

    $LASTEXITCODE | Should -Be 1
    $output | Should -Match 'carries files'
    $output | Should -Match 'payload.exe'
    $output | Should -Match 'payload.msi'
    $output | Should -Match 'payload.zip'
    $output | Should -Match 'payload.dll'
    (Get-Content $log -Raw) | Should -Not -Match ' push '
  }

  It 'rejects files a banned-extension list would miss, without pushing' {
    New-RepublishPackage -Name tarball | Out-Null
    $harness = New-RepublishHarness -Mode tarball
    $log = Join-Path $TestDrive 'tarball.log'
    $output = (& (Join-Path $PSHOME 'pwsh') -NoProfile -File $harness `
      -ScriptPath $republishScript -StubPath $chocoStub -Name tarball `
      -Mode tarball -LogPath $log) *>&1 | Out-String

    $LASTEXITCODE | Should -Be 1
    $output | Should -Match 'archive\.tar\.gz'
    $output | Should -Match 'manual\.pdf'
    # The stub also packs choco's own package plumbing; only the stray files above
    # may be flagged.
    $output | Should -Not -Match 'psmdcp'
    $output | Should -Not -Match 'Content_Types'
    (Get-Content $log -Raw) | Should -Not -Match ' push '
  }

  It 'pushes a clean package with the source and api key' {
    New-RepublishPackage -Name clean | Out-Null

    Invoke-Republish -Name clean | Out-Null

    $push = @(Get-Content $script:ChocoLogPath |
      Where-Object { $_ -match '^push ' })[0]
    $push | Should -Match '--source https://push\.chocolatey\.org/'
    $push | Should -Match '--api-key fixture-api-key'
  }

  It 'returns a failing exit code and summary when any package fails' {
    New-RepublishPackage -Name failed | Out-Null
    $harness = New-RepublishHarness -Mode binary
    $output = (& (Join-Path $PSHOME 'pwsh') -NoProfile -File $harness `
      -ScriptPath $republishScript -StubPath $chocoStub -Name failed `
      -Mode binary) *>&1 | Out-String

    $LASTEXITCODE | Should -Be 1
    $output | Should -Match '::error::failed: failed'
  }
}
