$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/pimalaya/himalaya/releases/download/v3.0.0/himalaya.x86_64-windows.zip'
  checksum64     = 'c4db8f443a583c04bca2c9eb03f4635a45e42c66bd34543c6f4cbae6e545f2b3'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs

# upstream ships the same binary twice; shim only the copy at the root
$duplicate = Join-Path $toolsPath 'result\bin\himalaya.exe'
if (Test-Path $duplicate) { New-Item -Path "$duplicate.ignore" -ItemType File -Force | Out-Null }
