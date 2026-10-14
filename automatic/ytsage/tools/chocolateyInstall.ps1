$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/oop7/YTSage/releases/download/v5.6.0/YTSage-v5.6.0-Setup.exe'
  checksum64     = '0dc3aa70499201d13efaa87093a11489f5afc1ae790679179b54b77df53cf08b'
  checksumType64 = 'sha256'
  softwareName   = 'YTSage*'
  silentArgs     = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
