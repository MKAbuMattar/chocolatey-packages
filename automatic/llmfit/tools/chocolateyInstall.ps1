$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/AlexsJones/llmfit/releases/download/v1.1.15/llmfit-v1.1.15-x86_64-pc-windows-msvc.zip'
  checksum64     = '6a18f8b4f8aca361fd5a979818d6122ad5cc305a1d4d02f9073db982b5911b46'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
