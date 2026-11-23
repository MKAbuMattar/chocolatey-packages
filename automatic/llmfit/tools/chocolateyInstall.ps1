$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/AlexsJones/llmfit/releases/download/v1.1.21/llmfit-v1.1.21-x86_64-pc-windows-msvc.zip'
  checksum64     = 'c2f98f41121d01df68eb2dd4b86c3269537c8c96d24dd22de3e07e093c329d43'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
