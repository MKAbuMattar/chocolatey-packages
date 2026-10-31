$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

# Manta.<version>.exe is electron-builder's portable build, not an installer: it unpacks
# itself to TEMP and starts Manta, passing on its arguments. Run as an installer with /S,
# it opened the app and never returned, and the Chocolatey verifier timed out after 45
# minutes. Keep the exe in the package and point a shim and a shortcut at it instead.
$app = Join-Path $toolsPath 'Manta.exe'
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileFullPath   = $app
  url64          = 'https://github.com/hql287/Manta/releases/download/v1.1.4/Manta.1.1.4.exe'
  checksum64     = 'f70084e104b8f25cda9fc3653567d9d4c52f7dbbb1038633191b9171263074bf'
  checksumType64 = 'sha256'
}

Get-ChocolateyWebFile @packageArgs

New-Item -Path "$app.ignore" -ItemType File -Force | Out-Null
Install-BinFile -Name 'manta' -Path $app -UseStart

$shortcut = Join-Path ([Environment]::GetFolderPath('CommonPrograms')) 'Manta.lnk'
Install-ChocolateyShortcut -ShortcutFilePath $shortcut -TargetPath $app -WorkingDirectory $toolsPath
