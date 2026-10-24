$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/yoanbernabeu/grepai/releases/download/v0.38.0/grepai_0.38.0_windows_amd64.zip'
  checksum64     = 'a8c6e877e3d194b3beed43d4718171b1a41350c82ceb64439cb7ba812de80626'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
