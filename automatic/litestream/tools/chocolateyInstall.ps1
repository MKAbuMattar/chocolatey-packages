$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/benbjohnson/litestream/releases/download/v0.5.15/litestream-0.5.15-windows-x86_64.zip'
  checksum64     = 'ddf66b672f4eb5f8c2fed70c822125aa6dba15eb0c261eec886bef8a699b7fb6'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
