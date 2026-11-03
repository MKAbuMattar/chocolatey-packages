$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/OpenBMB/PilotDeck/releases/download/v2026.11.04/PilotDeck-2026.1104.0-win-x64-setup.exe'
  checksum64     = 'e5d25a172a7db82d12ff0d1a2068f9bbfccedbfadbe5601c347bd1282fa3b32a'
  checksumType64 = 'sha256'
  softwareName   = 'PilotDeck*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
