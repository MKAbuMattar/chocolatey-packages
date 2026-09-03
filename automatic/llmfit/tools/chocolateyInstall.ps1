$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/AlexsJones/llmfit/releases/download/v1.1.14/llmfit-v1.1.14-x86_64-pc-windows-msvc.zip'
  checksum64     = 'ae186bf0acbc91faae49df983f41f735c0624020cb5cc639031e604a503c1a7a'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
