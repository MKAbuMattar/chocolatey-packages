$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/pimalaya/himalaya/releases/download/v2.0.0/himalaya.x86_64-windows.zip'
  checksum64     = 'b0b06da5fb72d79654fbe31f4f1c68a82cfa261e8a98ea2849580496f0a572fb'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs

# upstream ships the same binary twice; shim only the copy at the root
$duplicate = Join-Path $toolsPath 'result\bin\himalaya.exe'
if (Test-Path $duplicate) { New-Item -Path "$duplicate.ignore" -ItemType File -Force | Out-Null }
