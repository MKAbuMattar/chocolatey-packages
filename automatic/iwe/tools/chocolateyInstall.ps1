$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/iwe-org/iwe/releases/download/iwe-v0.29.2/iwe-v0.29.2-x86_64-pc-windows-msvc.zip'
  checksum64     = 'a524a4e6da64ad6a01d0eea8416c61ca4207d6479383e5e849cf67bfeb8211be'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
