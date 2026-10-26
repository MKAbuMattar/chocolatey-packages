$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

# The archive holds a single mimo.exe, which Chocolatey shims as `mimo`.
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/XiaomiMiMo/MiMo-Code/releases/download/v0.1.16/mimocode-windows-x64.zip'
  checksum64     = 'cebf70eb32877db4aef0e27f9194aca0147506dc2ada1d05c6547c0c90d604d1'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
