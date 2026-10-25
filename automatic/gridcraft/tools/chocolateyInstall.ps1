$ErrorActionPreference = 'Stop'

# A per-machine MSI (ALLUSERS=1), so Chocolatey's auto-uninstaller finds it by product name.
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'MSI'
  url64          = 'https://github.com/storytold/gridcraft/releases/download/v0.12.1/gridcraft-0.12.1-windows-x64.msi'
  checksum64     = '036f271206da7bbb453b1be9fe98fefb419eac829315803315e88df9f1ff4a71'
  checksumType64 = 'sha256'
  softwareName   = 'GridCraft*'
  silentArgs     = '/qn /norestart'
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
