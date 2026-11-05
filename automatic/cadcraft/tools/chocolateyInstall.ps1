$ErrorActionPreference = 'Stop'

# A per-machine install, so Chocolatey's auto-uninstaller finds it by product name.
# The Craft MSIs became dual-mode and install per user unless told ALLUSERS=1, which
# fails with 1603 beside an earlier per-machine copy.
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'MSI'
  url64          = 'https://github.com/storytold/cadcraft/releases/download/v0.17.1/cadcraft-0.17.1-windows-x64.msi'
  checksum64     = '642fc4f25a413896fd3fdd074459676ec8bfb3218127e1540e23769ad9ae2b48'
  checksumType64 = 'sha256'
  softwareName   = 'CADCraft*'
  silentArgs     = '/qn /norestart ALLUSERS=1'
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
