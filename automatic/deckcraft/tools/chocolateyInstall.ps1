$ErrorActionPreference = 'Stop'

# A per-machine install, so Chocolatey's auto-uninstaller finds it by product name.
# The Craft MSIs became dual-mode and install per user unless told ALLUSERS=1, which
# fails with 1603 beside an earlier per-machine copy.
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'MSI'
  url64          = 'https://github.com/storytold/deckcraft/releases/download/v0.17.0/deckcraft-0.17.0-windows-x64.msi'
  checksum64     = '57847b658554e3587fa0cacbd89e0061c1b14037ae9c52daff423f7c3f04f96c'
  checksumType64 = 'sha256'
  softwareName   = 'DeckCraft*'
  silentArgs     = '/qn /norestart ALLUSERS=1'
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
