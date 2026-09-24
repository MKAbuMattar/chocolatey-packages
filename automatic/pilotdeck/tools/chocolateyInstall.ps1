$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/OpenBMB/PilotDeck/releases/download/v2026.09.24/PilotDeck-2026.924.0-win-x64-setup.exe'
  checksum64     = 'e1958f1c7deece1cc050236893822bbf89b1aa3d2da6103afcf09573da4198fe'
  checksumType64 = 'sha256'
  softwareName   = 'PilotDeck*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
