$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/microsoft/data-formulator/releases/download/0.8b1/Data-Formulator-Windows-x64.zip'
  checksum64     = '78b2bab08a9a6260c4e8255cd2baaa6946d6599d398bd55559f3d1e3ac084ad7'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs

# Data Formulator is a GUI application, so the shim must not wait for it to exit
Get-ChildItem -Path $toolsPath -Recurse -Filter 'Data Formulator.exe' | ForEach-Object {
  New-Item -Path "$($_.FullName).gui" -ItemType File -Force | Out-Null
}
