$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/jub0t/Concat/releases/download/v0.2.1/Concat-0.2.1-windows-x86_64.zip'
  checksum64     = 'd3d9481fb6963f8f8fa364aba4481307cb5749442649a9dd99c83f5a401186ce'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
