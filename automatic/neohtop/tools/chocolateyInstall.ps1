$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/Abdenasser/neohtop/releases/download/v1.2.0/NeoHtop_1.2.0_x64.exe'
  checksum64     = 'e7930797eb8bcafbb22aecfefdf01a77527ec46069b8a8491215d33dabb9c2db'
  checksumType64 = 'sha256'
  fileFullPath   = Join-Path $toolsPath 'NeoHtop.exe'
}

Get-ChocolateyWebFile @packageArgs

# NeoHtop is a GUI application, so the shim must not wait for it to exit
New-Item -Path (Join-Path $toolsPath 'NeoHtop.exe.gui') -ItemType File -Force | Out-Null
