$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/OpenBMB/PilotDeck/releases/download/v2026.09.14/PilotDeck-2026.914.0-win-x64-setup.exe'
  checksum64     = '28b3142a23c1159c08995706c830e2fac378303ed86aa2dfcafa5fd7ef9d73c0'
  checksumType64 = 'sha256'
  softwareName   = 'PilotDeck*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
