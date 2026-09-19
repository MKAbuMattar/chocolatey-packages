$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/nubjs/nub/releases/download/v0.9.3/nub-win32-x64.zip'
  checksum64     = 'd847fc01b59d0ac70a3aa8912022212c0d54e25bc129e3c598d1abf3b6c3c3c2'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs

# nub bundles helper executables that would shadow tools already on PATH
Get-ChildItem -Path $toolsPath -Recurse -Include 'busybox.exe' | ForEach-Object {
  New-Item -Path "$($_.FullName).ignore" -ItemType File -Force | Out-Null
}
