$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/AlmogBaku/debug-skill/releases/download/v0.4.2/dap-windows-amd64.exe'
  checksum64     = '13004bc7ea46eba7d84363af99e59d4b55d0e1b7d8a65bc29b4cc8c739d0adee'
  checksumType64 = 'sha256'
  fileFullPath   = Join-Path $toolsPath 'dap.exe'
}

Get-ChocolateyWebFile @packageArgs
