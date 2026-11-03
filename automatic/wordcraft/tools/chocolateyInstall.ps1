$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

# The portable zip, not the MSI: WordCraft 0.3.0's MSI carries DesignCraft's UpgradeCode,
# so Windows Installer refuses it beside a newer DesignCraft, or removes DesignCraft when
# it is the newer one (https://github.com/storytold/wordcraft/issues/61).
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/storytold/wordcraft/releases/download/v0.15.0/wordcraft-0.15.0-windows-x64-portable.zip'
  checksum64     = '2d16f589fe4f8448cd6a8124ef92cfa61e075b9c02c401e6c1f67172aa9495a8'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs

Get-ChildItem -Path $toolsPath -Recurse -Include *.exe | ForEach-Object {
  New-Item -Path "$($_.FullName).ignore" -ItemType File -Force | Out-Null
}
$app = (Get-ChildItem -Path $toolsPath -Recurse -Filter 'wordcraft.exe' | Select-Object -First 1).FullName
$cli = (Get-ChildItem -Path $toolsPath -Recurse -Filter 'wordcraft-cli.exe' | Select-Object -First 1).FullName
Install-BinFile -Name 'wordcraft' -Path $app -UseStart
Install-BinFile -Name 'wordcraft-cli' -Path $cli

$shortcut = Join-Path ([Environment]::GetFolderPath('CommonPrograms')) 'WordCraft.lnk'
Install-ChocolateyShortcut -ShortcutFilePath $shortcut -TargetPath $app -WorkingDirectory (Split-Path $app)
