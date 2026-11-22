$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/alibaba/open-code-review/releases/download/v1.14.1/opencodereview-windows-amd64.exe'
  checksum64     = '207704128e2b14bf4c45899d9f2085d1b2bc693a02fff959b9332b211148527f'
  checksumType64 = 'sha256'
  fileFullPath   = Join-Path $toolsPath 'opencodereview.exe'
}

Get-ChocolateyWebFile @packageArgs
