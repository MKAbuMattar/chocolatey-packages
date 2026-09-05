$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/usestrix/strix/releases/download/v1.6.2/strix-1.6.2-windows-x86_64.zip'
  checksum64     = '1f656bc10442bef270ad85e331d74ccaa5355c8c61803dd561861bd391648d35'
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
