$ErrorActionPreference = 'Stop'

Uninstall-BinFile -Name 'fieldcraft'
Uninstall-BinFile -Name 'fieldcraft-cli'

$shortcut = Join-Path ([Environment]::GetFolderPath('CommonPrograms')) 'FieldCraft.lnk'
if (Test-Path $shortcut) { Remove-Item $shortcut -Force }
