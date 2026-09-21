$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/charmbracelet/crush/releases/download/v0.96.1/crush_0.96.1_Windows_x86_64.zip'
  checksum64     = 'bc95e7c64085e633a2250deacd5a0f2555a461d6aa40812c6b7f406564c9cb49'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
