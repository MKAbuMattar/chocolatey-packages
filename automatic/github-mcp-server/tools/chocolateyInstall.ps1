$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/github/github-mcp-server/releases/download/v2.0.3/github-mcp-server_Windows_x86_64.zip'
  checksum64     = 'f0e1b9880a1b88730d1250d1c25cfee39617ec3e800a7a252f2279cd0c8394e0'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
