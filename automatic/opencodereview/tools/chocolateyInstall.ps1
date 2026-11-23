$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/alibaba/open-code-review/releases/download/v1.14.2/opencodereview-windows-amd64.exe'
  checksum64     = '614151f4c280910f6fc501a2793e1dd1b59483eea0144f10550092ccd533f652'
  checksumType64 = 'sha256'
  fileFullPath   = Join-Path $toolsPath 'opencodereview.exe'
}

Get-ChocolateyWebFile @packageArgs
