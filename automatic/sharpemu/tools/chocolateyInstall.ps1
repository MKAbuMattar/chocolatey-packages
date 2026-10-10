$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/sharpemu/sharpemu/releases/download/v0.0.5-nexus-release.2/sharpemu-0.0.5-nexus-release.2-win-x64.zip'
  checksum64     = '580d6b48431857ea50b67bd8af2439cd37777eb26799dfb5d8395cb837c5a6e7'
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
