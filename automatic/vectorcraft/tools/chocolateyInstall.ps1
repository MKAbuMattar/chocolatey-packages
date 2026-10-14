$ErrorActionPreference = 'Stop'

# A per-machine MSI (ALLUSERS=1), so Chocolatey's auto-uninstaller finds it by product name.
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'MSI'
  url64          = 'https://github.com/storytold/vectorcraft/releases/download/v0.11.0/vectorcraft-0.11.0-windows-x64.msi'
  checksum64     = '35ae11a4d22932842076d4f8dd1023504398194e0cf45a9c8246122838d5560a'
  checksumType64 = 'sha256'
  softwareName   = 'VectorCraft*'
  silentArgs     = '/qn /norestart'
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
