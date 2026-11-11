$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/OpenBMB/PilotDeck/releases/download/v2026.11.11/PilotDeck-2026.1111.0-win-x64-setup.exe'
  checksum64     = '51dd1551f36e5ecdc40494cf9aa916d339bdb870ddcc6bf869c0b8674454b5f2'
  checksumType64 = 'sha256'
  softwareName   = 'PilotDeck*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
