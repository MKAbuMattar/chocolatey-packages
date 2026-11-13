$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

# The archive holds a single mimo.exe, which Chocolatey shims as `mimo`.
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/XiaomiMiMo/MiMo-Code/releases/download/v0.1.17/mimocode-windows-x64.zip'
  checksum64     = '0592e55bd48b1441227a00a8bbf5f5a967023d3e01960b799c59ca50abfcda4d'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
