$ErrorActionPreference = 'Stop'

# A per-machine install, so Chocolatey's auto-uninstaller finds it by product name.
# The Craft MSIs became dual-mode and install per user unless told ALLUSERS=1, which
# fails with 1603 beside an earlier per-machine copy.
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'MSI'
  url64          = 'https://github.com/storytold/vectorcraft/releases/download/v0.23.0/vectorcraft-0.23.0-windows-x64.msi'
  checksum64     = '4d2de9f501ac0c00510db2bf7281f22d6759807b3f5220899c59c7d4d6c603b2'
  checksumType64 = 'sha256'
  softwareName   = 'VectorCraft*'
  silentArgs     = '/qn /norestart ALLUSERS=1'
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
