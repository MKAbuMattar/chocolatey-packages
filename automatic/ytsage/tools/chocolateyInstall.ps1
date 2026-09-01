$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/oop7/YTSage/releases/download/v5.5.0/YTSage-v5.5.0-Setup.exe'
  checksum64     = '7b7a1883f86e53c260f76bcd03dc3db6c5fa71becd7e56c7024edf4c2b9f7586'
  checksumType64 = 'sha256'
  softwareName   = 'YTSage*'
  silentArgs     = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
