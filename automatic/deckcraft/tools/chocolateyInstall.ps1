$ErrorActionPreference = 'Stop'

# A per-machine install, so Chocolatey's auto-uninstaller finds it by product name.
# The Craft MSIs became dual-mode and install per user unless told ALLUSERS=1, which
# fails with 1603 beside an earlier per-machine copy.
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'MSI'
  url64          = 'https://github.com/storytold/deckcraft/releases/download/v0.13.1/deckcraft-0.13.1-windows-x64.msi'
  checksum64     = '768e6ac70271d664831af9009f12adcdf784cb03460b7000aa76ea4883f46cbd'
  checksumType64 = 'sha256'
  softwareName   = 'DeckCraft*'
  silentArgs     = '/qn /norestart ALLUSERS=1'
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
