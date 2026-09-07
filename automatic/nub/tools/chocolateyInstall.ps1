$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/nubjs/nub/releases/download/v0.9.0/nub-win32-x64.zip'
  checksum64     = 'f32f7fee19585a3e0858cec7854b19e6e8178a510ee0b198ea5fb2e76e563d62'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs

# nub bundles helper executables that would shadow tools already on PATH
Get-ChildItem -Path $toolsPath -Recurse -Include 'busybox.exe' | ForEach-Object {
  New-Item -Path "$($_.FullName).ignore" -ItemType File -Force | Out-Null
}
