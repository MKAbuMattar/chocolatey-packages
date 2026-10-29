$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/iwe-org/iwe/releases/download/iwe-v0.29.3/iwe-v0.29.3-x86_64-pc-windows-msvc.zip'
  checksum64     = '55a838845c153c51404416826fd4af6559d4cb6a23db34ec82abc5e894b3650f'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
