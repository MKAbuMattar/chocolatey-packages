$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/alibaba/open-code-review/releases/download/v1.12.1/opencodereview-windows-amd64.exe'
  checksum64     = '6033c3af93a8da41ab73d6013c562b57d197bebf614e79904410c1c4359ce6a1'
  checksumType64 = 'sha256'
  fileFullPath   = Join-Path $toolsPath 'opencodereview.exe'
}

Get-ChocolateyWebFile @packageArgs
