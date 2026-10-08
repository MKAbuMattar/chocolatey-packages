$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/Gaurav-Gosain/tuios/releases/download/v0.9.0/tuios_0.9.0_Windows_x86_64.tar.gz'
  checksum64     = 'a7cfe85a22dc1e9561c316106177cfca5342d1fe8ed48ea7f2cf01af21f46cf6'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs

# upstream ships .tar.gz, so unpack the tar that the first extract left behind.
# The tar is found rather than named, because its name carries the version.
Get-ChildItem -Path $toolsPath -Filter *.tar | ForEach-Object {
  Get-ChocolateyUnzip -FileFullPath $_.FullName -Destination $toolsPath
  Remove-Item $_.FullName -Force
}
