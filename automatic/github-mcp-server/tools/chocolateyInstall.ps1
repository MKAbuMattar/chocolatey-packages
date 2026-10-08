$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/github/github-mcp-server/releases/download/v2.0.2/github-mcp-server_Windows_x86_64.zip'
  checksum64     = '4ae64087501650752f21c9d5af5378107a5116d94ee1cf37786b22b8c4bd99df'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
