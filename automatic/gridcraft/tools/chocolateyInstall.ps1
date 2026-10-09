$ErrorActionPreference = 'Stop'

# A per-machine MSI (ALLUSERS=1), so Chocolatey's auto-uninstaller finds it by product name.
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'MSI'
  url64          = 'https://github.com/storytold/gridcraft/releases/download/v0.3.0/gridcraft-0.3.0-windows-x64.msi'
  checksum64     = '0764d69b1e600d49ac9eacb1ecfb0f1ac4aa416c16549b9babc28780c2fcfb84'
  checksumType64 = 'sha256'
  softwareName   = 'GridCraft*'
  silentArgs     = '/qn /norestart'
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
