$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/charmbracelet/crush/releases/download/v0.88.1/crush_0.88.1_Windows_x86_64.zip'
  checksum64     = '85d689a4b05324cb392f36980710ca8ad6bfb7ffebfd2770557b76031fc683c3'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
