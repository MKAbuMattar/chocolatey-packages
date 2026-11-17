$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/github/github-mcp-server/releases/download/v2.2.0/github-mcp-server_Windows_x86_64.zip'
  checksum64     = '6ecda644e8ea54b26acbc76e80379f4afb6ac1a4c2521366584f2a7f23e3a850'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
