$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/nubjs/nub/releases/download/v0.9.2/nub-win32-x64.zip'
  checksum64     = '85602d803ffe0f92a66664172870916bf8945c2889a6118dc01794bd530873ce'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs

# nub bundles helper executables that would shadow tools already on PATH
Get-ChildItem -Path $toolsPath -Recurse -Include 'busybox.exe' | ForEach-Object {
  New-Item -Path "$($_.FullName).ignore" -ItemType File -Force | Out-Null
}
