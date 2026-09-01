$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/usestrix/strix/releases/download/v1.6.0/strix-1.6.0-windows-x86_64.zip'
  checksum64     = '57b4c906547e20a3d259fad50062c876c1abba546e813b6267276da418cffda6'
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
