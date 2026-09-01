$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/nubjs/nub/releases/download/v0.7.5/nub-win32-x64.zip'
  checksum64     = '061956457776121ec8a4de43da47a85eebb9e3c26111ff39fc5c55865836de43'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs

# nub bundles helper executables that would shadow tools already on PATH
Get-ChildItem -Path $toolsPath -Recurse -Include 'busybox.exe' | ForEach-Object {
  New-Item -Path "$($_.FullName).ignore" -ItemType File -Force | Out-Null
}
