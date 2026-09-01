$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/pimalaya/himalaya/releases/download/v2.1.0/himalaya.x86_64-windows.zip'
  checksum64     = 'dd2682bf61baabd52c1dfead872e09156862b9b3ea076595a1f7f9559c8d4435'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs

# upstream ships the same binary twice; shim only the copy at the root
$duplicate = Join-Path $toolsPath 'result\bin\himalaya.exe'
if (Test-Path $duplicate) { New-Item -Path "$duplicate.ignore" -ItemType File -Force | Out-Null }
