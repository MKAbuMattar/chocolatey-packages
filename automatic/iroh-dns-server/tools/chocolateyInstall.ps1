$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/n0-computer/iroh/releases/download/v1.0.3/iroh-dns-server-v1.0.3-x86_64-pc-windows-msvc.zip'
  checksum64     = '24313101b0677cf245dd5d673c43045f33fd0f16ad394e536596c2df37283eba'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
