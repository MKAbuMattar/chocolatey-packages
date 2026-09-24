$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/rtk-ai/rtk/releases/download/v0.50.0/rtk-x86_64-pc-windows-msvc.zip'
  checksum64     = 'cb03399305135dd59ee23eb59a3260ccdeea5a8e08fbc7a271b115b85583a6c9'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
