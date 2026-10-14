$ErrorActionPreference = 'Stop'

# A per-machine MSI (ALLUSERS=1), so Chocolatey's auto-uninstaller finds it by product name.
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'MSI'
  url64          = 'https://github.com/storytold/lightcraft/releases/download/v0.8.0/lightcraft-0.8.0-windows-x64.msi'
  checksum64     = '2ae1b2c8c20f1fd11cf61dd944e09f90a72abc72797a879fcf92ed3b779620f3'
  checksumType64 = 'sha256'
  softwareName   = 'LightCraft*'
  silentArgs     = '/qn /norestart'
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
