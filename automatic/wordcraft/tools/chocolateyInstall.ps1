$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

# The portable zip, not the MSI: WordCraft 0.3.0's MSI carries DesignCraft's UpgradeCode,
# so Windows Installer refuses it beside a newer DesignCraft, or removes DesignCraft when
# it is the newer one (https://github.com/storytold/wordcraft/issues/61).
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/storytold/wordcraft/releases/download/v0.3.0/wordcraft-0.3.0-windows-x64-portable.zip'
  checksum64     = '51230628ff51977126d4d8f6db44942aac9b6e1ef4d42e3220a9f030a0503aed'
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
