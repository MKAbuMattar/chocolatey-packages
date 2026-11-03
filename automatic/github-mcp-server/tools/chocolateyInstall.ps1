$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/github/github-mcp-server/releases/download/v2.1.0/github-mcp-server_Windows_x86_64.zip'
  checksum64     = 'ddce274916ebf31346dee71a0ed3345e80cd36b060a0bfb8160db0afc411e9d3'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
