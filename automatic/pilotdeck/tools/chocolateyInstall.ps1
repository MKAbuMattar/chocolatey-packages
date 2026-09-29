$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/OpenBMB/PilotDeck/releases/download/v2026.09.29/PilotDeck-2026.929.0-win-x64-setup.exe'
  checksum64     = 'b37b842456d6def5120f45ab48a7045937afdd3b67a37f5dd018624cb3422f44'
  checksumType64 = 'sha256'
  softwareName   = 'PilotDeck*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
