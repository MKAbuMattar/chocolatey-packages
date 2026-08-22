function Invoke-FixtureChoco {
  param(
    [object[]]$Arguments,
    [object]$Calls,
    [string]$PackMode,
    [string]$FailingPackage,
    [string]$LogPath
  )
  $call = @($Arguments)
  if ($null -ne $Calls) {
    $Calls.Add($call)
  }
  if ($LogPath) {
    Add-Content -LiteralPath $LogPath -Value ($call -join ' ')
  }

  if ($Arguments[0] -eq 'pack') {
    $id = Split-Path (Get-Location) -Leaf
    if ($FailingPackage -eq $id) {
      $global:LASTEXITCODE = 7
      return
    }

    $outputIndex = [Array]::IndexOf($Arguments, '--outputdirectory') + 1
    $out = $Arguments[$outputIndex]
    $nuspec = [xml](Get-Content (Join-Path (Get-Location) "$id.nuspec") -Raw)
    $nupkg = Join-Path $out "$id.$($nuspec.package.metadata.version).nupkg"
    $zip = [IO.Compression.ZipFile]::Open(
      $nupkg,
      [IO.Compression.ZipArchiveMode]::Create
    )
    try {
      $entryNames = if ($PackMode -eq 'binary') {
        @(
          'tools/payload.exe'
          'tools/payload.msi'
          'tools/payload.zip'
          'tools/payload.dll'
        )
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
  } elseif ($Arguments[0] -eq 'push') {
    $global:LASTEXITCODE = 0
  }
}

function choco {
  Invoke-FixtureChoco `
    -Arguments $args `
    -PackMode $env:CHOCO_STUB_MODE `
    -FailingPackage $env:CHOCO_STUB_FAILING_PACKAGE `
    -LogPath $env:CHOCO_STUB_LOG_PATH
}
