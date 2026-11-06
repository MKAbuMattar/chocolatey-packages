$ErrorActionPreference = 'Stop'

# A per-machine install, so Chocolatey's auto-uninstaller finds it by product name.
# The Craft MSIs became dual-mode and install per user unless told ALLUSERS=1, which
# fails with 1603 beside an earlier per-machine copy.
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'MSI'
  url64          = 'https://github.com/storytold/vectorcraft/releases/download/v0.22.0/vectorcraft-0.22.0-windows-x64.msi'
  checksum64     = '578a92ba4020d8935f64e0437f3fb3b5c5dca7af3d8fc70effb9c7fd9bf9d283'
  checksumType64 = 'sha256'
  softwareName   = 'VectorCraft*'
  silentArgs     = '/qn /norestart ALLUSERS=1'
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
