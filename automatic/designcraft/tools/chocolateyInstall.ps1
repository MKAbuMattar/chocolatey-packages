$ErrorActionPreference = 'Stop'

# A per-machine MSI (ALLUSERS=1), so Chocolatey's auto-uninstaller finds it by product name.
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'MSI'
  url64          = 'https://github.com/storytold/designcraft/releases/download/v0.13.0/designcraft-0.13.0-windows-x64.msi'
  checksum64     = '84421b0b90a897cd35110cc9b3d3bca13c30b9298ac77f4e13eb9ec9978b20ce'
  checksumType64 = 'sha256'
  softwareName   = 'DesignCraft*'
  silentArgs     = '/qn /norestart'
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
