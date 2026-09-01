$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/servo/servo/releases/download/v0.5.0/servo-x86_64-windows-msvc.zip'
  checksum64     = '7f2f5e79914345d073e14b4814662ec8a9763448814b539eec54e5a6ac253c8b'
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
