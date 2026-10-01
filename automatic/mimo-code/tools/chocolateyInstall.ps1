$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

# The archive holds a single mimo.exe, which Chocolatey shims as `mimo`.
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/XiaomiMiMo/MiMo-Code/releases/download/v0.1.14/mimocode-windows-x64.zip'
  checksum64     = '227365cdc340f281f12bb5d5c18ff6b6a9fca7cc757b96e54ad78c3c325a2a24'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
