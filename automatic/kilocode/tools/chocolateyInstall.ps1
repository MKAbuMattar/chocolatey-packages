$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/Kilo-Org/kilocode/releases/download/v7.5.16/kilo-windows-x64.zip'
  checksum64     = 'e68690fdbe764dfd0800b4444b0812347d5ff3a6e71d3b68d6a9d24315158308'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs

# Kilo Code is a GUI application, so the shim must not wait for it to exit
Get-ChildItem -Path $toolsPath -Recurse -Filter 'kilo.exe' | ForEach-Object {
  New-Item -Path "$($_.FullName).gui" -ItemType File -Force | Out-Null
}
