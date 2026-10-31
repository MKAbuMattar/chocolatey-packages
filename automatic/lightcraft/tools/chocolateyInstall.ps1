$ErrorActionPreference = 'Stop'

# A per-machine install, so Chocolatey's auto-uninstaller finds it by product name.
# The Craft MSIs became dual-mode and install per user unless told ALLUSERS=1, which
# fails with 1603 beside an earlier per-machine copy.
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'MSI'
  url64          = 'https://github.com/storytold/lightcraft/releases/download/v0.16.0/lightcraft-0.16.0-windows-x64.msi'
  checksum64     = '6133f27569668fa473807b4db29ef6f02bba3730b0c5b4de6a059fcde14d7498'
  checksumType64 = 'sha256'
  softwareName   = 'LightCraft*'
  silentArgs     = '/qn /norestart ALLUSERS=1'
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
