$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/AlexsJones/llmfit/releases/download/v1.1.16/llmfit-v1.1.16-x86_64-pc-windows-msvc.zip'
  checksum64     = 'bd95bc78e65a15f4d7b62431c082e0d55c9505739f63f6fdf6f9d69605c270ba'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
