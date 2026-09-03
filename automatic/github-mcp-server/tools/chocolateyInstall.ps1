$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/github/github-mcp-server/releases/download/v1.12.0/github-mcp-server_Windows_x86_64.zip'
  checksum64     = 'bc8782deda12dc1f36a182d0205bb4f11b05aee0eec7e2c8c109bb8f622fb4b4'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
