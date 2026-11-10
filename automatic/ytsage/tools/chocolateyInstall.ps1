$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/oop7/YTSage/releases/download/v5.6.5/YTSage-v5.6.5-Setup.exe'
  checksum64     = '2e5c4d1c5fa1b70e583e0e4bba80f3b5334ab46fadaa2a2eefe4b4ca6a922f60'
  checksumType64 = 'sha256'
  softwareName   = 'YTSage*'
  silentArgs     = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
