$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/AlexsJones/llmfit/releases/download/v1.1.6/llmfit-v1.1.6-x86_64-pc-windows-msvc.zip'
  checksum64     = 'fe5f847aedc9bf7a331fbc513d4ccb51bc9b92b6885046b99716a91e0d81540c'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
