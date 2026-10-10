$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

# The portable zip, not the MSI: WordCraft 0.3.0's MSI carries DesignCraft's UpgradeCode,
# so Windows Installer refuses it beside a newer DesignCraft, or removes DesignCraft when
# it is the newer one (https://github.com/storytold/wordcraft/issues/61).
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/storytold/wordcraft/releases/download/v0.4.0/wordcraft-0.4.0-windows-x64-portable.zip'
  checksum64     = '2e43b7d49eb9d0ff22f9df95b24eede135fd049bbd0c15706438bc588d29c512'
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
