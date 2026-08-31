$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/usestrix/strix/releases/download/v1.5.3/strix-1.5.3-windows-x86_64.zip'
  checksum64     = 'a40b3e5359c2c131a868f0d632aa25cd2068c35d6faef5dec04f53ce864d733d'
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
