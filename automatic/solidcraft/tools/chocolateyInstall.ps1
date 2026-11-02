$ErrorActionPreference = 'Stop'

# A per-machine install, so Chocolatey's auto-uninstaller finds it by product name.
# The Craft MSIs became dual-mode and install per user unless told ALLUSERS=1, which
# fails with 1603 beside an earlier per-machine copy.
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'MSI'
  url64          = 'https://github.com/tangency-labs/solidcraft/releases/download/v0.30.0/solidcraft-0.30.0-windows-x64.msi'
  checksum64     = '9b27e4f12c8608f5056a1cdfac1e1e92d760f8cbdc12748cd8e7715db9f771eb'
  checksumType64 = 'sha256'
  softwareName   = 'SolidCraft*'
  silentArgs     = '/qn /norestart ALLUSERS=1'
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
