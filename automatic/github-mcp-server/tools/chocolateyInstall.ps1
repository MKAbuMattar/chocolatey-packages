$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/github/github-mcp-server/releases/download/v1.11.0/github-mcp-server_Windows_x86_64.zip'
  checksum64     = 'd16a3b2bbf775365541aa18729c0c3ff5e1b26dfb5dc190928895ba482211268'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
