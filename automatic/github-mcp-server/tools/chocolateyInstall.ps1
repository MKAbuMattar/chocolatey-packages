$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/github/github-mcp-server/releases/download/v1.12.1/github-mcp-server_Windows_x86_64.zip'
  checksum64     = '5d8a8b69262c5026c94a1fdb063960b5a0bdf32632a4ebd5ba4a314d9b4157fa'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
