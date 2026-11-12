$ErrorActionPreference = 'Stop'

# A per-machine install, so Chocolatey's auto-uninstaller finds it by product name.
# The Craft MSIs became dual-mode and install per user unless told ALLUSERS=1, which
# fails with 1603 beside an earlier per-machine copy.
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'MSI'
  url64          = 'https://github.com/storytold/materialcraft/releases/download/v0.4.1/materialcraft-0.4.1-windows-x64.msi'
  checksum64     = '542a7334778e258c0c5428dfad2f97dc898212019bb8cdebf6bc4596c6705688'
  checksumType64 = 'sha256'
  softwareName   = 'MaterialCraft*'
  silentArgs     = '/qn /norestart ALLUSERS=1'
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
