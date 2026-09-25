$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/nubjs/nub/releases/download/v0.9.5/nub-win32-x64.zip'
  checksum64     = '2686fadb14062bfeddd9db4bb9e778602cd21097fe3b7c1d61f9f36cdcbe5b53'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs

# nub bundles helper executables that would shadow tools already on PATH
Get-ChildItem -Path $toolsPath -Recurse -Include 'busybox.exe' | ForEach-Object {
  New-Item -Path "$($_.FullName).ignore" -ItemType File -Force | Out-Null
}
