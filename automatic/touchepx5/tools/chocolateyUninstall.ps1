$ErrorActionPreference = 'Stop'

Uninstall-BinFile -Name 'touchepx5'

$shortcut = Join-Path ([Environment]::GetFolderPath('CommonPrograms')) 'Touché PX5.lnk'
if (Test-Path $shortcut) { Remove-Item $shortcut -Force }
