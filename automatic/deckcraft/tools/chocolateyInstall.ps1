$ErrorActionPreference = 'Stop'

# A per-machine MSI (ALLUSERS=1), so Chocolatey's auto-uninstaller finds it by product name.
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'MSI'
  url64          = 'https://github.com/storytold/deckcraft/releases/download/v0.3.0/deckcraft-0.3.0-windows-x64.msi'
  checksum64     = '707ad46d6a17428291a0193cb7f1aaf8d5bf103d2202381f770b233845586b4d'
  checksumType64 = 'sha256'
  softwareName   = 'DeckCraft*'
  silentArgs     = '/qn /norestart'
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
