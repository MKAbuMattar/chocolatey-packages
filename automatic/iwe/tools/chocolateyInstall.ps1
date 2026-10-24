$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/iwe-org/iwe/releases/download/iwe-v0.29.1/iwe-v0.29.1-x86_64-pc-windows-msvc.zip'
  checksum64     = '0a9891ec7e8630d2161c727feec2156af2ad89d1a2a8e3024aca94ea23d1e01e'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
