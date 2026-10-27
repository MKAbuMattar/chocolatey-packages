$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/KytyPS5/KytyPS5/releases/download/KytyPS5-2026-10-27-3583331/KytyPS5-2026-10-27-3583331-Windows-x64.zip'
  checksum64     = 'df0378c8908f18d1be491030a42b9c0f323f60176e451970d8fe065d42257b8b'
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
