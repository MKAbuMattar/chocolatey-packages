$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/OpenBMB/PilotDeck/releases/download/v2026.09.25/PilotDeck-2026.925.0-win-x64-setup.exe'
  checksum64     = '0fd2474dbc77feb25af8dd707d2022fc31988a98915d65b4dd36eee32796ee3a'
  checksumType64 = 'sha256'
  softwareName   = 'PilotDeck*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
