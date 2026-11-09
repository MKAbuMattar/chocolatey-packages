$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/Kodiqa-Solutions/VaultS3/releases/download/v5.0.11/vaults3-windows-amd64.tar.gz'
  checksum64     = '21f800708fc73f3be885d4f42e407c2ccd1b19532ba22ca2a0bdfd9a72692a2c'
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
