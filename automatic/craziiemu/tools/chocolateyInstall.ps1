$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/craze1pirate/craziiEmu/releases/download/v0.34-alpha/craziiemu-0.34-alpha-win-x64.zip'
  checksum64     = 'f7efb40d4f1f0b54b15960ac7730c6dc538d16f093ed2a165261e7eac386541d'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs

# A portable GUI app with a single executable. Shim it by name and start it rather than
# wait on it, and give it a Start Menu entry.
Get-ChildItem -Path $toolsPath -Recurse -Include *.exe | ForEach-Object {
  New-Item -Path "$($_.FullName).ignore" -ItemType File -Force | Out-Null
}
$app = Join-Path $toolsPath 'CraziiEmu.exe'
Install-BinFile -Name 'craziiemu' -Path $app -UseStart

$shortcut = Join-Path ([Environment]::GetFolderPath('CommonPrograms')) 'CraziiEmu.lnk'
Install-ChocolateyShortcut -ShortcutFilePath $shortcut -TargetPath $app -WorkingDirectory $toolsPath
