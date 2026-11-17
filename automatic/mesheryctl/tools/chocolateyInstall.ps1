$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/meshery/meshery/releases/download/v1.0.81/mesheryctl_1.0.81_Windows_x86_64.zip'
  checksum64     = '368607f72fdfd42733b4868b89fe0af284a2fc0a8971e141f39f68f9c249523f'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
