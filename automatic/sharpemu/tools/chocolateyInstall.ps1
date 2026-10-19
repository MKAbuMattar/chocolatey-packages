$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/sharpemu/sharpemu/releases/download/v0.0.6-mono/sharpemu-0.0.6-mono-win-x64.zip'
  checksum64     = '25c0ce2297bb6a003b8ba19ba3ef45486db4114cd1c0f8e12009001f60ea011a'
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
