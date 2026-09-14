$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/charmbracelet/crush/releases/download/v0.94.2/crush_0.94.2_Windows_x86_64.zip'
  checksum64     = '39731c1de31ff6f60fe5058f51ba8049175bde7b6b5755c2cc60133e8a93101f'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
