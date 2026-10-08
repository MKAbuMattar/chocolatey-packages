$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/sharpemu/sharpemu/releases/download/v0.0.5-nexus/sharpemu-0.0.5-nexus-win-x64.zip'
  checksum64     = '7ef3166bc44971b54df924e44f4fddc5f42869c2447be8284b387e3e45e5c028'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs

# A portable GUI app with a single executable. Shim it by name and start it rather than
# wait on it, and give it a Start Menu entry.
Get-ChildItem -Path $toolsPath -Recurse -Include *.exe | ForEach-Object {
  New-Item -Path "$($_.FullName).ignore" -ItemType File -Force | Out-Null
}
$app = Join-Path $toolsPath 'SharpEmu.exe'
Install-BinFile -Name 'sharpemu' -Path $app -UseStart

$shortcut = Join-Path ([Environment]::GetFolderPath('CommonPrograms')) 'SharpEmu.lnk'
Install-ChocolateyShortcut -ShortcutFilePath $shortcut -TargetPath $app -WorkingDirectory $toolsPath
