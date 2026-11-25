$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/OpenBMB/PilotDeck/releases/download/v2026.11.24/PilotDeck-2026.1124.0-win-x64-setup.exe'
  checksum64     = '2821230124a3a3257bbea9009e01644ebd692db6412c1d31a2a22f6d6ba1336d'
  checksumType64 = 'sha256'
  softwareName   = 'PilotDeck*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
