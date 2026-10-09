$ErrorActionPreference = 'Stop'

Uninstall-BinFile -Name 'wordcraft'
Uninstall-BinFile -Name 'wordcraft-cli'

$shortcut = Join-Path ([Environment]::GetFolderPath('CommonPrograms')) 'WordCraft.lnk'
if (Test-Path $shortcut) { Remove-Item $shortcut -Force }
