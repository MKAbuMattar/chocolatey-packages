$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/AlexsJones/llmfit/releases/download/v1.1.17/llmfit-v1.1.17-x86_64-pc-windows-msvc.zip'
  checksum64     = '661b6ea57d835f681fbabcf3366649ff681d0081267fd3a05db254e67af6073f'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
