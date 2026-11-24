$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/github/github-mcp-server/releases/download/v2.3.0/github-mcp-server_Windows_x86_64.zip'
  checksum64     = '15b658171f82622975f9d72037c7ad1ce8a5124cd1d516925c19c908a5b646d8'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
