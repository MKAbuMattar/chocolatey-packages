$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/OpenBMB/PilotDeck/releases/download/v2026.11.09/PilotDeck-2026.1109.0-win-x64-setup.exe'
  checksum64     = 'a51ea5e6e0f864a2b40457540fc778d3756df3710e76ad91cc237a6d554af23a'
  checksumType64 = 'sha256'
  softwareName   = 'PilotDeck*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
