$ErrorActionPreference = 'Stop'

# A per-machine install, so Chocolatey's auto-uninstaller finds it by product name.
# The Craft MSIs became dual-mode and install per user unless told ALLUSERS=1, which
# fails with 1603 beside an earlier per-machine copy.
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'MSI'
  url64          = 'https://github.com/storytold/gridcraft/releases/download/v0.14.2/gridcraft-0.14.2-windows-x64.msi'
  checksum64     = 'c782dbb579ce23a0b2e5303510b907a23777ca5b854837fabc20b5ef4dbf149f'
  checksumType64 = 'sha256'
  softwareName   = 'GridCraft*'
  silentArgs     = '/qn /norestart ALLUSERS=1'
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
