$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/charmbracelet/crush/releases/download/v0.94.1/crush_0.94.1_Windows_x86_64.zip'
  checksum64     = '03f8c4f61f42ae95c94aecc10c18bf9b92bb1482ed4e6c810c21103b9134d01e'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
