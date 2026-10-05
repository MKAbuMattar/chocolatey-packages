$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

# The archive holds a single mimo.exe, which Chocolatey shims as `mimo`.
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/XiaomiMiMo/MiMo-Code/releases/download/v0.1.15/mimocode-windows-x64.zip'
  checksum64     = 'c9b8a1bb12b4e621098b622629982715cc8423587c2640d8c2fa0113d3c09511'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
