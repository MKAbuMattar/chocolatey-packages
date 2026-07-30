$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/servo/servo/releases/download/v0.3.0/servo-x86_64-windows-msvc.zip'
  checksum64     = '297f98cbe212ba550140e5352d73971ac02d5ecba044dfdb98bce3e646b464d9'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs

# Servo ships several executables, some of which would shadow tools the user
# already has on PATH, so shim only the entry points
Get-ChildItem -Path $toolsPath -Recurse -Include *.exe | ForEach-Object {
  New-Item -Path "$($_.FullName).ignore" -ItemType File -Force | Out-Null
}
Install-BinFile -Name 'servo' -Path (Join-Path $toolsPath 'servo\servoshell.exe') -UseStart
