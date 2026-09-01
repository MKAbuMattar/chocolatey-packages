$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/AlexsJones/llmfit/releases/download/v1.1.12/llmfit-v1.1.12-x86_64-pc-windows-msvc.zip'
  checksum64     = 'ef13ae7066ef536959f61ed11c953b5a8638bc6cf81d98af785444b562b6f8a9'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
