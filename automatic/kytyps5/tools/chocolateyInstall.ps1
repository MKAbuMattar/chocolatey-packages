$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/KytyPS5/KytyPS5/releases/download/KytyPS5-2026-09-30-bc193f5/KytyPS5-2026-09-30-bc193f5-Windows-x64.zip'
  checksum64     = '69c72cd4f7cdcc6aa824ce6311557aea9eb82ec9880e142f2cb63d5b8f220e91'
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
