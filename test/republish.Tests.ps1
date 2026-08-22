BeforeAll {
  Add-Type -AssemblyName System.IO.Compression.FileSystem
  $republishScript = Join-Path $TestDrive 'republish.ps1'
  Copy-Item (Join-Path $PSScriptRoot '..' 'republish.ps1') $republishScript
  $global:ChocoCalls = [Collections.Generic.List[object]]::new()
  $global:PackMode = 'clean'

  function New-RepublishPackage {
    param([string]$Name, [string]$Version = '1.2.3')
    $dir = Join-Path $TestDrive "automatic/$Name"
    New-Item $dir -ItemType Directory -Force | Out-Null
    $nuspec = "<package><metadata><id>$Name</id><version>$Version</version></metadata></package>"
    Set-Content -LiteralPath (Join-Path $dir "$Name.nuspec") `
      -Value $nuspec -NoNewline
    $dir
  }

  function choco {
    $call = @($args)
    $global:ChocoCalls.Add($call)
    if ($args[0] -eq 'pack') {
      if ($global:PackMode -eq 'pack-failure') {
        $global:LASTEXITCODE = 7
        return
      }
      $outputIndex = [Array]::IndexOf($args, '--outputdirectory') + 1
      $out = $args[$outputIndex]
      $id = Split-Path (Get-Location) -Leaf
      $nuspec = [xml](Get-Content (Join-Path (Get-Location) "$id.nuspec") -Raw)
      $nupkg = Join-Path $out "$id.$($nuspec.package.metadata.version).nupkg"
      $zip = [IO.Compression.ZipFile]::Open($nupkg, [IO.Compression.ZipArchiveMode]::Create)
      try {
        $entryNames = if ($global:PackMode -eq 'binary') {
          @('tools/payload.exe', 'tools/payload.msi', 'tools/payload.zip', 'tools/payload.dll')
        } else {
          @('tools/readme.txt')
        }
        foreach ($entryName in $entryNames) {
          $entry = $zip.CreateEntry($entryName)
          $writer = [IO.StreamWriter]::new($entry.Open())
          $writer.Write('fixture')
          $writer.Dispose()
        }
      }
      finally {
        $zip.Dispose()
      }
      $global:LASTEXITCODE = 0
    }
    elseif ($args[0] -eq 'push') {
      $global:LASTEXITCODE = 0
    }
  }

  function Invoke-Republish {
    param([string[]]$Name, [switch]$WhatIf)
    $global:ChocoCalls.Clear()
    $global:PackMode = 'clean'
    $env:api_key = 'fixture-api-key'
    $params = @{ Name = $Name }
    if ($WhatIf) { $params.WhatIf = $true }
    (& $republishScript @params) *>&1 | Out-String
  }

  function New-RepublishHarness {
    param([ValidateSet('clean', 'binary', 'pack-failure')][string]$Mode)
    $harness = Join-Path $TestDrive "republish-$Mode.ps1"
    @"
param([string]`$ScriptPath, [string[]]`$Name, [string]`$Mode, [string]`$LogPath, [switch]`$WhatIf)
`$Name = `$Name -split ','
Add-Type -AssemblyName System.IO.Compression.FileSystem
function choco {
  `$call = @(`$args)
  if (`$LogPath) { Add-Content -LiteralPath `$LogPath -Value (`$call -join ' ') }
  if (`$args[0] -eq 'pack') {
    if (`$Mode -eq 'pack-failure') { `$global:LASTEXITCODE = 7; return }
    `$out = `$args[[Array]::IndexOf(`$args, '--outputdirectory') + 1]
    `$id = Split-Path (Get-Location) -Leaf
    `$xml = [xml](Get-Content (Join-Path (Get-Location) "`$id.nuspec") -Raw)
    `$path = Join-Path `$out "`$id.`$(`$xml.package.metadata.version).nupkg"
    `$zip = [IO.Compression.ZipFile]::Open(`$path, [IO.Compression.ZipArchiveMode]::Create)
    try {
      `$entryNames = if (`$Mode -eq 'binary') {
        @('tools/payload.exe', 'tools/payload.msi', 'tools/payload.zip', 'tools/payload.dll')
      } else {
        @('tools/readme.txt')
      }
      foreach (`$entryName in `$entryNames) {
        `$entry = `$zip.CreateEntry(`$entryName)
        `$writer = [IO.StreamWriter]::new(`$entry.Open())
        `$writer.Write('fixture')
        `$writer.Dispose()
      }
    } finally { `$zip.Dispose() }
    `$global:LASTEXITCODE = 0
  } elseif (`$args[0] -eq 'push') { `$global:LASTEXITCODE = 0 }
}
`$params = @{ Name = `$Name }
if (`$WhatIf) { `$params.WhatIf = `$true }
& `$ScriptPath @params
exit `$LASTEXITCODE
"@ | Set-Content $harness
    $harness
  }
}

Describe 'republish.ps1' {
  BeforeEach {
    $global:ChocoCalls.Clear()
    $global:PackMode = 'clean'
    $env:api_key = 'fixture-api-key'
  }

  It 'reads the version from the nuspec and packs the package' {
    New-RepublishPackage -Name alpha -Version '4.5.6' | Out-Null

    $output = Invoke-Republish -Name alpha

    $output | Should -Match 'alpha 4.5.6'
    $global:ChocoCalls.Count | Should -Be 2
    $global:ChocoCalls[0][0] | Should -Be 'pack'
    $global:ChocoCalls[1][0] | Should -Be 'push'
  }

  It 'packs but never pushes in WhatIf mode and does not require an api key' {
    New-RepublishPackage -Name dry-run | Out-Null
    Remove-Item Env:api_key -ErrorAction SilentlyContinue

    $output = Invoke-Republish -Name dry-run -WhatIf

    $output | Should -Match 'WhatIf: would push dry-run'
    @($global:ChocoCalls | Where-Object { $_[0] -eq 'pack' }).Count | Should -Be 1
    @($global:ChocoCalls | Where-Object { $_[0] -eq 'push' }).Count | Should -Be 0
  }

  It 'throws when api_key is missing without WhatIf' {
    New-RepublishPackage -Name protected | Out-Null
    Remove-Item Env:api_key -ErrorAction SilentlyContinue

    { & $republishScript -Name protected } | Should -Throw '*api_key is not set*'
  }

  It 'reports an unknown package as failed' {
    $harness = New-RepublishHarness -Mode clean
    $log = Join-Path $TestDrive 'unknown.log'
    $output = (& (Join-Path $PSHOME 'pwsh') -NoProfile -File $harness `
      -ScriptPath $republishScript -Name unknown -Mode clean -LogPath $log) *>&1 | Out-String

    $LASTEXITCODE | Should -Be 1
    $output | Should -Match 'unknown is not a package'
    $output | Should -Match 'failed: unknown'
  }

  It 'continues processing other packages after a pack failure' {
    New-RepublishPackage -Name broken | Out-Null
    New-RepublishPackage -Name healthy | Out-Null
    $harness = New-RepublishHarness -Mode pack-failure
    $output = (& (Join-Path $PSHOME 'pwsh') -NoProfile -File $harness `
      -ScriptPath $republishScript -Name broken,healthy -Mode pack-failure) *>&1 | Out-String

    $LASTEXITCODE | Should -Be 1
    $output | Should -Match 'broken pack failed'
    $output | Should -Match 'healthy pack failed'
  }

  It 'rejects binary entries without pushing' {
    New-RepublishPackage -Name binary | Out-Null
    $harness = New-RepublishHarness -Mode binary
    $log = Join-Path $TestDrive 'binary.log'
    $output = (& (Join-Path $PSHOME 'pwsh') -NoProfile -File $harness `
      -ScriptPath $republishScript -Name binary -Mode binary -LogPath $log) *>&1 | Out-String

    $LASTEXITCODE | Should -Be 1
    $output | Should -Match 'carries binaries'
    $output | Should -Match 'payload.exe'
    $output | Should -Match 'payload.msi'
    $output | Should -Match 'payload.zip'
    $output | Should -Match 'payload.dll'
    (Get-Content $log -Raw) | Should -Not -Match ' push '
  }

  It 'pushes a clean package with the source and api key' {
    New-RepublishPackage -Name clean | Out-Null

    Invoke-Republish -Name clean | Out-Null

    $push = @($global:ChocoCalls | Where-Object { $_[0] -eq 'push' })[0]
    $push -join ' ' | Should -Match '--source https://push\.chocolatey\.org/'
    $push -join ' ' | Should -Match '--api-key fixture-api-key'
  }

  It 'returns a failing exit code and summary when any package fails' {
    New-RepublishPackage -Name failed | Out-Null
    $harness = New-RepublishHarness -Mode binary
    $output = (& (Join-Path $PSHOME 'pwsh') -NoProfile -File $harness `
      -ScriptPath $republishScript -Name failed -Mode binary) *>&1 | Out-String

    $LASTEXITCODE | Should -Be 1
    $output | Should -Match '::error::failed: failed'
  }
}
