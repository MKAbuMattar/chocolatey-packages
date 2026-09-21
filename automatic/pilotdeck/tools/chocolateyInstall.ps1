$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/OpenBMB/PilotDeck/releases/download/v2026.09.19/PilotDeck-2026.919.0-win-x64-setup.exe'
  checksum64     = '2d142cbc7737aa2bf9a15772486b2132fa7b8b543330480c5b049533a3308bc1'
  checksumType64 = 'sha256'
  softwareName   = 'PilotDeck*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
