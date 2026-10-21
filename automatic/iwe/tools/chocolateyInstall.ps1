$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/iwe-org/iwe/releases/download/iwe-v0.29.0/iwe-v0.29.0-x86_64-pc-windows-msvc.zip'
  checksum64     = '27ea3161d94aaadf2cd447f28c4c4a3935754af2e46b9489f923e4e3b6f85d5c'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
