$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/charmbracelet/crush/releases/download/v0.103.0/crush_0.103.0_Windows_x86_64.zip'
  checksum64     = 'e5845ae5cc160c7ea47c33fd96035d5361246db9efb2ed7a22ea6c1cfe718753'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
