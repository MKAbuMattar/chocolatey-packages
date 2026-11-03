$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/OpenBMB/PilotDeck/releases/download/v2026.11.03/PilotDeck-2026.1103.0-win-x64-setup.exe'
  checksum64     = '8f974f19b2a1d3c0f9f8e62e8ff971693e2b2c18b77f24715218b110ffe2c041'
  checksumType64 = 'sha256'
  softwareName   = 'PilotDeck*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
