$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/OpenBMB/PilotDeck/releases/download/desktop-v2026.09.02/PilotDeck-2026.902.0-win-x64-setup.exe'
  checksum64     = 'ca1e5ce3282ea675ccfd75059dfef865015973e12246102fd87e8c9fbd53997b'
  checksumType64 = 'sha256'
  softwareName   = 'PilotDeck*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
