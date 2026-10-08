$ErrorActionPreference = 'Stop'

Uninstall-BinFile -Name 'craziiemu'

$shortcut = Join-Path ([Environment]::GetFolderPath('CommonPrograms')) 'CraziiEmu.lnk'
if (Test-Path $shortcut) { Remove-Item $shortcut -Force }
