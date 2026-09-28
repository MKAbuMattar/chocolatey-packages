$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/n0-computer/iroh/releases/download/v1.3.0/iroh-relay-v1.3.0-x86_64-pc-windows-msvc.zip'
  checksum64     = '2064308ca7df288d68eef89c80c194afe5038d85888c87079147dca862195a01'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
