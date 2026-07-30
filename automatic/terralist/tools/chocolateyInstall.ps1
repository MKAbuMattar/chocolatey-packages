$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/terralist/terralist/releases/download/v0.10.6/terralist_windows_amd64.zip'
  checksum64     = '7028c9cea5414dddbc22e43d93e73e55f158f958f12a96d75a4f466e421106b2'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
