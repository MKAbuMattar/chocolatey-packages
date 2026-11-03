$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/AlexsJones/llmfit/releases/download/v1.1.20/llmfit-v1.1.20-x86_64-pc-windows-msvc.zip'
  checksum64     = '1f848ddf2554adb89b3a31a034245826694148249fadace572c4544bb3c9c489'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
