$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/usestrix/strix/releases/download/v1.4.1/strix-1.4.1-windows-x86_64.zip'
  checksum64     = 'ff7dc05d4daba6e47d24d0c8ec77dfe74c3c591cb56ebe32a9ad041d7122a0b0'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs

# The executable inside the archive is named after the version, so shimming it
# directly would give a command name that changes on every release
Get-ChildItem -Path $toolsPath -Recurse -Filter *.exe | ForEach-Object {
  New-Item -Path "$($_.FullName).ignore" -ItemType File -Force | Out-Null
  Install-BinFile -Name 'strix' -Path $_.FullName
}
