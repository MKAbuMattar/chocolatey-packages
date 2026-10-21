$ErrorActionPreference = 'Stop'

# A per-machine MSI (ALLUSERS=1), so Chocolatey's auto-uninstaller finds it by product name.
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'MSI'
  url64          = 'https://github.com/tangency-labs/solidcraft/releases/download/v0.18.2/solidcraft-0.18.2-windows-x64.msi'
  checksum64     = '3ce64d64a5019efb437fa1dae600c4de77b91c33261c49a613d00c2467db69a6'
  checksumType64 = 'sha256'
  softwareName   = 'SolidCraft*'
  silentArgs     = '/qn /norestart'
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
