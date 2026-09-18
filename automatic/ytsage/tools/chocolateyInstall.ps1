$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/oop7/YTSage/releases/download/v5.5.6/YTSage-v5.5.6-Setup.exe'
  checksum64     = '0d173f844cfc89e3c8aad7bf5da6ef0dc1e4ce804265075fecb5ca2676e0cb68'
  checksumType64 = 'sha256'
  softwareName   = 'YTSage*'
  silentArgs     = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
