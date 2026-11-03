$ErrorActionPreference = 'Stop'

# A per-machine install, so Chocolatey's auto-uninstaller finds it by product name.
# The Craft MSIs became dual-mode and install per user unless told ALLUSERS=1, which
# fails with 1603 beside an earlier per-machine copy.
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'MSI'
  url64          = 'https://github.com/storytold/photocraft/releases/download/v0.20.1/photocraft-0.20.1-windows-x64.msi'
  checksum64     = 'ad14e3c43c10e10e94e50ccd61b503dccb29c4f1464bbd17ae6e3c2b703b3f80'
  checksumType64 = 'sha256'
  softwareName   = 'PhotoCraft*'
  silentArgs     = '/qn /norestart ALLUSERS=1'
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
