$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/servo/servo/releases/download/v0.6.0/servo-x86_64-windows-msvc.zip'
  checksum64     = 'b13edde2a93dc22586943e69de884e2781a8ba0d7e0ddd620653df01c85abada'
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
