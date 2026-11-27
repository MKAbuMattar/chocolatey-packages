$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

# The archive holds a single mimo.exe, which Chocolatey shims as `mimo`.
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/XiaomiMiMo/MiMo-Code/releases/download/v0.1.18/mimocode-windows-x64.zip'
  checksum64     = 'db9929005ddb919dc74af52878b8387e15f94d703500931d2f93a385a3c1a7df'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
