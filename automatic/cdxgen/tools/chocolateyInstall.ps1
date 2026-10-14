$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/cdxgen/cdxgen/releases/download/v13.4.0/cdxgen-windows-amd64.exe'
  checksum64     = '0b4a6ec411a70127d72e2f6fc45277f03fa64d4237a40325d0ff117634b76375'
  checksumType64 = 'sha256'
  fileFullPath   = Join-Path $toolsPath 'cdxgen.exe'
}

Get-ChocolateyWebFile @packageArgs
