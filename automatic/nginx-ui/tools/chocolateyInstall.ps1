$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/0xJacky/nginx-ui/releases/download/v3.0.5/nginx-ui-windows-64.zip'
  checksum64     = '1a96ca653ed9738fea2040391b7ed0c90fd0ca846cbc30ca7f0d9d07343b6563'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
