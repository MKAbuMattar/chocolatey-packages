$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/oop7/YTSage/releases/download/v5.2.0/YTSage-v5.2.0-Setup.exe'
  checksum64     = '6f55503b42bfcd1bb5245b6c01cca9ace4e332b5fceaac021178b6fccc930b08'
  checksumType64 = 'sha256'
  softwareName   = 'YTSage*'
  silentArgs     = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
