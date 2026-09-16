$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/github/github-mcp-server/releases/download/v1.12.2/github-mcp-server_Windows_x86_64.zip'
  checksum64     = 'c08872e69f700d4219e7b4ab9607d56d7993171519ee32b62fccb8fba0cab673'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
