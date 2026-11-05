$ErrorActionPreference = 'Stop'

# A per-machine install, so Chocolatey's auto-uninstaller finds it by product name.
# The Craft MSIs became dual-mode and install per user unless told ALLUSERS=1, which
# fails with 1603 beside an earlier per-machine copy.
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'MSI'
  url64          = 'https://github.com/storytold/deckcraft/releases/download/v0.15.1/deckcraft-0.15.1-windows-x64.msi'
  checksum64     = '5cfe8f5b63ec03645b542081efd6315c25a17ab63ca75da4049003f6c776e0d1'
  checksumType64 = 'sha256'
  softwareName   = 'DeckCraft*'
  silentArgs     = '/qn /norestart ALLUSERS=1'
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
