$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/awslabs/llrt/releases/download/v0.9.0-beta/llrt-windows-x64.zip'
  checksum64     = 'ddddefdeb044549299e16b0edb2e2e834e94bdec7169e7aa3967907981502602'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
