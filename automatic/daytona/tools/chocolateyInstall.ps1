$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/daytonaio/daytona/releases/download/v0.190.0/daytona-windows-amd64.exe'
  checksum64     = '2ce3fb2d87e99a279bd61a383472db612c81747bb75a17a4c06deef45a3830f1'
  checksumType64 = 'sha256'
  fileFullPath   = Join-Path $toolsPath 'daytona.exe'
}

Get-ChocolateyWebFile @packageArgs
