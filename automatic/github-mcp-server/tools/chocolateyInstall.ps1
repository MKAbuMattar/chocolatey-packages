$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/github/github-mcp-server/releases/download/v1.14.0/github-mcp-server_Windows_x86_64.zip'
  checksum64     = '0277e5fca965ae7fa31c7193954eae948ddc13997bc4b835858be858ac55cabe'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
