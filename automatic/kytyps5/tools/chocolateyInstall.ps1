$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/KytyPS5/KytyPS5/releases/download/KytyPS5-2026-10-26-3c62269/KytyPS5-2026-10-26-3c62269-Windows-x64.zip'
  checksum64     = 'e25558d482103997e86efe6814a57eb97fccd4c80f9e00e1fb490b77f9f8d49b'
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
