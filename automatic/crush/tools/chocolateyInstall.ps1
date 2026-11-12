$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/charmbracelet/crush/releases/download/v0.101.0/crush_0.101.0_Windows_x86_64.zip'
  checksum64     = '88939e174c7d64f67a1b392ae2ac7d372def7b0fec31de26e2b2f2d478ce994f'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
