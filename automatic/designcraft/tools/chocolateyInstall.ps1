$ErrorActionPreference = 'Stop'

# A per-machine install, so Chocolatey's auto-uninstaller finds it by product name.
# The Craft MSIs became dual-mode and install per user unless told ALLUSERS=1, which
# fails with 1603 beside an earlier per-machine copy.
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'MSI'
  url64          = 'https://github.com/storytold/designcraft/releases/download/v0.20.0/designcraft-0.20.0-windows-x64.msi'
  checksum64     = 'acbbdfe92cebb96edd85282929d20aabf2ffadcb3495286d50570af6b24039f8'
  checksumType64 = 'sha256'
  softwareName   = 'DesignCraft*'
  silentArgs     = '/qn /norestart ALLUSERS=1'
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
