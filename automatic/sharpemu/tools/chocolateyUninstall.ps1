$ErrorActionPreference = 'Stop'

Uninstall-BinFile -Name 'sharpemu'

$shortcut = Join-Path ([Environment]::GetFolderPath('CommonPrograms')) 'SharpEmu.lnk'
if (Test-Path $shortcut) { Remove-Item $shortcut -Force }
