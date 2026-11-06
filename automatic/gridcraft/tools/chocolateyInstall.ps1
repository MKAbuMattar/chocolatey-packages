$ErrorActionPreference = 'Stop'

# A per-machine install, so Chocolatey's auto-uninstaller finds it by product name.
# The Craft MSIs became dual-mode and install per user unless told ALLUSERS=1, which
# fails with 1603 beside an earlier per-machine copy.
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'MSI'
  url64          = 'https://github.com/storytold/gridcraft/releases/download/v0.17.0/gridcraft-0.17.0-windows-x64.msi'
  checksum64     = '5aaf520a1b62e8e8505cd78264f854b659b0e48ea50b173cf6d331a51bc72f99'
  checksumType64 = 'sha256'
  softwareName   = 'GridCraft*'
  silentArgs     = '/qn /norestart ALLUSERS=1'
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
