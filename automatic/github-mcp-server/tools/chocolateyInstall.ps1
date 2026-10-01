$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/github/github-mcp-server/releases/download/v1.13.0/github-mcp-server_Windows_x86_64.zip'
  checksum64     = '75accfd7f98c2d06c8cbda43d7d243a51a97baced7e6a5d61dd6f7df710fd464'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
