$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/Drakkar-Software/OctoBot/releases/download/2.1.1/OctoBot_windows_x64.exe'
  checksum64     = '3098986c115b688c5405212f9bfc54f3ad47a3e06ba4c62c417ab50aa3339601'
  checksumType64 = 'sha256'
  fileFullPath   = Join-Path $toolsPath 'OctoBot.exe'
}

Get-ChocolateyWebFile @packageArgs

# OctoBot is a GUI application, so the shim must not wait for it to exit
New-Item -Path (Join-Path $toolsPath 'OctoBot.exe.gui') -ItemType File -Force | Out-Null
