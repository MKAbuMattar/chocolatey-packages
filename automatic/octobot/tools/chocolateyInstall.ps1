$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/Drakkar-Software/OctoBot/releases/download/3.0.0-beta2/OctoBot_windows_x64.exe'
  checksum64     = '8e50b21c8b52beaa160950edab015f55c9cdd7288f8d6d4434c10cff8c4bdef5'
  checksumType64 = 'sha256'
  fileFullPath   = Join-Path $toolsPath 'OctoBot.exe'
}

Get-ChocolateyWebFile @packageArgs

# OctoBot is a GUI application, so the shim must not wait for it to exit
New-Item -Path (Join-Path $toolsPath 'OctoBot.exe.gui') -ItemType File -Force | Out-Null
