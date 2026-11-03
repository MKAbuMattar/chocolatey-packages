$ErrorActionPreference = 'Stop'

# A per-machine install, so Chocolatey's auto-uninstaller finds it by product name.
# The Craft MSIs became dual-mode and install per user unless told ALLUSERS=1, which
# fails with 1603 beside an earlier per-machine copy.
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'MSI'
  url64          = 'https://github.com/storytold/deckcraft/releases/download/v0.15.0/deckcraft-0.15.0-windows-x64.msi'
  checksum64     = 'b4ff130751838962aeec0776b1c6bb2ed4a083808ca61e9cf518a7e809f15515'
  checksumType64 = 'sha256'
  softwareName   = 'DeckCraft*'
  silentArgs     = '/qn /norestart ALLUSERS=1'
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
