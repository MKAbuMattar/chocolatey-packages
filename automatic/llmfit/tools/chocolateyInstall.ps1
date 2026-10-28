$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/AlexsJones/llmfit/releases/download/v1.1.18/llmfit-v1.1.18-x86_64-pc-windows-msvc.zip'
  checksum64     = '52b774f0f153f22adf53a81240cfd4afeccdbd0be8b9e75abae9fdba6d964c21'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
