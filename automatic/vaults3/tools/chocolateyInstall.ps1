$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/Kodiqa-Solutions/VaultS3/releases/download/v4.4.76/vaults3-windows-amd64.tar.gz'
  checksum64     = 'fa46757ae6ff93f9c87f6f3f396da5738860e8331b3ce87c247c0a77e402c03a'
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
