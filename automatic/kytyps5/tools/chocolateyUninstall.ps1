$ErrorActionPreference = 'Stop'

Uninstall-BinFile -Name 'kytyps5'

$shortcut = Join-Path ([Environment]::GetFolderPath('CommonPrograms')) 'KytyPS5.lnk'
if (Test-Path $shortcut) { Remove-Item $shortcut -Force }
