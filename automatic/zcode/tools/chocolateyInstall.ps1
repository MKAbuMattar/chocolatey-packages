$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/zai-org/ZCode/releases/download/v3.17.1/ZCode-3.17.1-win-x64.exe'
  checksum64     = 'd9c21c5472f7357daf429dbfbb6b4ec8f77c83ecc13aa9fde7583b0c328e6cef'
  checksumType64 = 'sha256'
  softwareName   = 'ZCode*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
