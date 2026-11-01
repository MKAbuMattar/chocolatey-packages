$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/sharpemu/sharpemu/releases/download/v0.0.7-pulse/sharpemu-0.0.7-pulse-win-x64.zip'
  checksum64     = '3ab0ac49f2401dc8aa73ec671e6c83fb7785f7aacbaedc194de15c2bc4d0733c'
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
