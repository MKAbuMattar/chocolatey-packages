$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/Q00/ouroboros/releases/download/v0.56.2/ouroboros-tui-x86_64-pc-windows-msvc.exe'
  checksum64     = 'a422335d331cb333c288ef3ec22b7b5f7cc467b866832ab4ed15faa23009a197'
  checksumType64 = 'sha256'
  fileFullPath   = Join-Path $toolsPath 'ouroboros.exe'
}

Get-ChocolateyWebFile @packageArgs
