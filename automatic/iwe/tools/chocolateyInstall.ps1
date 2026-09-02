$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/iwe-org/iwe/releases/download/iwe-v0.23.0/iwe-v0.23.0-x86_64-pc-windows-msvc.zip'
  checksum64     = '13ce097c904c4fb42c9b792a03e4039e1f47f4ec0248817fd68f0460fdfa2fcb'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
