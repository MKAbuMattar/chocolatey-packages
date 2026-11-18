$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/KytyPS5/KytyPS5/releases/download/KytyPS5-2026-11-18-b3295be/KytyPS5-2026-11-18-b3295be-Windows-x64.zip'
  checksum64     = '344466f043c76fa756113a5976e606081feb4eee03c10e1a36c125ca1e9c1117'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs

# The archive carries two executables: launcher.exe, the Qt front end people open, and
# kyty_emulator.exe, the engine the launcher starts. Shim nothing automatically, then
# name the launcher, which is a GUI app and so is started rather than waited on.
Get-ChildItem -Path $toolsPath -Recurse -Include *.exe | ForEach-Object {
  New-Item -Path "$($_.FullName).ignore" -ItemType File -Force | Out-Null
}
$launcher = Join-Path $toolsPath 'launcher.exe'
Install-BinFile -Name 'kytyps5' -Path $launcher -UseStart

$shortcut = Join-Path ([Environment]::GetFolderPath('CommonPrograms')) 'KytyPS5.lnk'
Install-ChocolateyShortcut -ShortcutFilePath $shortcut -TargetPath $launcher -WorkingDirectory $toolsPath
