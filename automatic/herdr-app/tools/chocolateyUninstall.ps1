$ErrorActionPreference = 'Stop'

Uninstall-BinFile -Name 'herdr-app'

$shortcut = Join-Path ([Environment]::GetFolderPath('CommonPrograms')) 'Herdr.lnk'
if (Test-Path $shortcut) { Remove-Item $shortcut -Force }
