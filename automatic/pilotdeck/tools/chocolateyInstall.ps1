$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/OpenBMB/PilotDeck/releases/download/v2026.11.10/PilotDeck-2026.1110.0-win-x64-setup.exe'
  checksum64     = '9cec2900740bc1d81117019ad611a63b8689757f292fc8776e78dc634ba23fa0'
  checksumType64 = 'sha256'
  softwareName   = 'PilotDeck*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
