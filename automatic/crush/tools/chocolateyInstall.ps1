$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/charmbracelet/crush/releases/download/v0.102.0/crush_0.102.0_Windows_x86_64.zip'
  checksum64     = 'd9e60f2003210b54946b840dc1ef20a266ff633bdf67b43b8b8d155eadfd2f13'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
