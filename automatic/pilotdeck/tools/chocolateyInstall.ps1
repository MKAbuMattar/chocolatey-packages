$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/OpenBMB/PilotDeck/releases/download/v2026.11.12/PilotDeck-2026.1112.0-win-x64-setup.exe'
  checksum64     = 'a0070317bef35c69d0f0ecdc31dad77fa76c3cf4211a29c9f10ae8be650d0b24'
  checksumType64 = 'sha256'
  softwareName   = 'PilotDeck*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
