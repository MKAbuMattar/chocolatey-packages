$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/OpenBMB/PilotDeck/releases/download/v2026.11.19/PilotDeck-2026.1119.0-win-x64-setup.exe'
  checksum64     = 'c979f19d40a79e83ca6ceb1c31244c5cee238f5a182fd9d92f809d3185475a98'
  checksumType64 = 'sha256'
  softwareName   = 'PilotDeck*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
