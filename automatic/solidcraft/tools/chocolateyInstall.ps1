$ErrorActionPreference = 'Stop'

# A per-machine install, so Chocolatey's auto-uninstaller finds it by product name.
# The Craft MSIs became dual-mode and install per user unless told ALLUSERS=1, which
# fails with 1603 beside an earlier per-machine copy.
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'MSI'
  url64          = 'https://github.com/tangency-labs/solidcraft/releases/download/v0.45.0/solidcraft-0.45.0-windows-x64.msi'
  checksum64     = '1b1732c5a1f146996cfa265ca5ae3caea86302f23504dfe2d56f42b7d08c1f82'
  checksumType64 = 'sha256'
  softwareName   = 'SolidCraft*'
  silentArgs     = '/qn /norestart ALLUSERS=1'
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
