$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/alibaba/open-code-review/releases/download/v1.11.6/opencodereview-windows-amd64.exe'
  checksum64     = 'c2652bb4f70c8c3af38bf69656ab05f10c13cd9457da77bc374f41ab9c25de25'
  checksumType64 = 'sha256'
  fileFullPath   = Join-Path $toolsPath 'opencodereview.exe'
}

Get-ChocolateyWebFile @packageArgs
