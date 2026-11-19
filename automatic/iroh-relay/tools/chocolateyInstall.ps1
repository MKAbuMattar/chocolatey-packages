$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/n0-computer/iroh/releases/download/v1.4.2/iroh-relay-v1.4.2-x86_64-pc-windows-msvc.zip'
  checksum64     = '1d28624516483f9f1c762daef24890c15c68d1f7f23d6211a65d090a55ce2139'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
