$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/OpenBMB/PilotDeck/releases/download/v2026.11.18/PilotDeck-2026.1118.0-win-x64-setup.exe'
  checksum64     = 'f82ab15635fede73be723f7cdc71036dc7ebb79d952483c187f4e07b7f5d1e9d'
  checksumType64 = 'sha256'
  softwareName   = 'PilotDeck*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
