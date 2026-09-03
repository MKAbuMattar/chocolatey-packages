$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/meshery/meshery/releases/download/v1.0.69/mesheryctl_1.0.69_Windows_x86_64.zip'
  checksum64     = '0607c751664148fdd5f76af1ecd41483dfb8f02566d55d1fd63c051e3989b4f2'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
