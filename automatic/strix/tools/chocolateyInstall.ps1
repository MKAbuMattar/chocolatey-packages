$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/usestrix/strix/releases/download/v1.6.1/strix-1.6.1-windows-x86_64.zip'
  checksum64     = '660945a9afe4e881cf22866cf1412a4fbfc78ce97aa238dcda1062b530e90656'
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
