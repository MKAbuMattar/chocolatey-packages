$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/Drakkar-Software/OctoBot/releases/download/3.0.0-beta3/OctoBot_windows_x64.exe'
  checksum64     = '19a11e97b7b20071b8bc986d21aca20aacfa57a8e9c10c806daef82cdb522b0f'
  checksumType64 = 'sha256'
  fileFullPath   = Join-Path $toolsPath 'OctoBot.exe'
}

Get-ChocolateyWebFile @packageArgs

# OctoBot is a GUI application, so the shim must not wait for it to exit
New-Item -Path (Join-Path $toolsPath 'OctoBot.exe.gui') -ItemType File -Force | Out-Null
