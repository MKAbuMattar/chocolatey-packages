$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/alibaba/open-code-review/releases/download/v1.13.2/opencodereview-windows-amd64.exe'
  checksum64     = '6b932a7ec7aa91cbb7725ebb8f082504e82824b2616cff42aaaf62a6fec5fe6b'
  checksumType64 = 'sha256'
  fileFullPath   = Join-Path $toolsPath 'opencodereview.exe'
}

Get-ChocolateyWebFile @packageArgs
