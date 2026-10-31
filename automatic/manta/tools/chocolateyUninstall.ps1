$ErrorActionPreference = 'Stop'

Uninstall-BinFile -Name 'manta'

$shortcut = Join-Path ([Environment]::GetFolderPath('CommonPrograms')) 'Manta.lnk'
if (Test-Path $shortcut) { Remove-Item $shortcut -Force }
