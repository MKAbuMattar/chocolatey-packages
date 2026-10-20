$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

# FieldCraft ships only a portable zip for Windows.
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/tangency-labs/fieldcraft/releases/download/v0.7.0/fieldcraft-0.7.0-windows-x64.zip'
  checksum64     = '98bbac7a5b2266fb30e64aa34bf5379db986660d3c3753e3ee8be06f2460961d'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs

Get-ChildItem -Path $toolsPath -Recurse -Include *.exe | ForEach-Object {
  New-Item -Path "$($_.FullName).ignore" -ItemType File -Force | Out-Null
}
$app = (Get-ChildItem -Path $toolsPath -Recurse -Filter 'fieldcraft.exe' | Select-Object -First 1).FullName
$cli = (Get-ChildItem -Path $toolsPath -Recurse -Filter 'fieldcraft-cli.exe' | Select-Object -First 1).FullName
Install-BinFile -Name 'fieldcraft' -Path $app -UseStart
Install-BinFile -Name 'fieldcraft-cli' -Path $cli

$shortcut = Join-Path ([Environment]::GetFolderPath('CommonPrograms')) 'FieldCraft.lnk'
Install-ChocolateyShortcut -ShortcutFilePath $shortcut -TargetPath $app -WorkingDirectory (Split-Path $app)
