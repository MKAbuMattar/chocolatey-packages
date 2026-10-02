$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/pimalaya/himalaya/releases/download/v2.2.1/himalaya.x86_64-windows.zip'
  checksum64     = '34ef6f148834aeafa2c9a558ec144a678fb12dcfcc618786b0eaeceb52794e00'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs

# upstream ships the same binary twice; shim only the copy at the root
$duplicate = Join-Path $toolsPath 'result\bin\himalaya.exe'
if (Test-Path $duplicate) { New-Item -Path "$duplicate.ignore" -ItemType File -Force | Out-Null }
