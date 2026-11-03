$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/benbjohnson/litestream/releases/download/v0.5.18/litestream-0.5.18-windows-x86_64.zip'
  checksum64     = '7cc9115cb3ff2ee4800d476a328ffca6e8f3504da15e010b8c9c8ef1b9ab811f'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
