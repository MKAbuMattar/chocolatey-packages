$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/github/github-mcp-server/releases/download/v2.0.1/github-mcp-server_Windows_x86_64.zip'
  checksum64     = 'ec37110134fd94f2980ae78ed0d69493623e730da97f0983050cc46539c30a30'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
