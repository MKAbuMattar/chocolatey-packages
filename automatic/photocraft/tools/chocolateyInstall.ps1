$ErrorActionPreference = 'Stop'

# A per-machine install, so Chocolatey's auto-uninstaller finds it by product name.
# The Craft MSIs became dual-mode and install per user unless told ALLUSERS=1, which
# fails with 1603 beside an earlier per-machine copy.
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'MSI'
  url64          = 'https://github.com/storytold/photocraft/releases/download/v0.18.0/photocraft-0.18.0-windows-x64.msi'
  checksum64     = '0be3669adfda7f4b505f2ecdd443b110ef056daa03f27a65eb1d35948f6a1529'
  checksumType64 = 'sha256'
  softwareName   = 'PhotoCraft*'
  silentArgs     = '/qn /norestart ALLUSERS=1'
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
