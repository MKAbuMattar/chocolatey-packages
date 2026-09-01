$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/charmbracelet/crush/releases/download/v0.92.0/crush_0.92.0_Windows_x86_64.zip'
  checksum64     = '38fa2c2ad6b165e9f847b28e37938261b2257c9d4fcf688fbcc22babc38999c6'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
