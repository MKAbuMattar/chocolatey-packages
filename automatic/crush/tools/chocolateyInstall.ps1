$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/charmbracelet/crush/releases/download/v0.97.1/crush_0.97.1_Windows_x86_64.zip'
  checksum64     = '168b5c40caee6242acff82c02b7239ad6bdb02291e253eb03855fa4c7e063bec'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
