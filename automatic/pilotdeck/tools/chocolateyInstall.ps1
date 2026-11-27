$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/OpenBMB/PilotDeck/releases/download/v2026.11.26/PilotDeck-2026.1126.0-win-x64-setup.exe'
  checksum64     = 'e1dfe140e082dba775a994e173a5d8b7702084cd4a476234e98fbdefb725dbce'
  checksumType64 = 'sha256'
  softwareName   = 'PilotDeck*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
