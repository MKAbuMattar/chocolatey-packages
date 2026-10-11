$ErrorActionPreference = 'Stop'

# A per-machine MSI (ALLUSERS=1), so Chocolatey's auto-uninstaller finds it by product name.
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'MSI'
  url64          = 'https://github.com/storytold/lightcraft/releases/download/v0.6.0/lightcraft-0.6.0-windows-x64.msi'
  checksum64     = 'cb61c2c8d8d5fe7f11b0dcdc9eebe1fc180f514d58b43018aacda9444b8a4772'
  checksumType64 = 'sha256'
  softwareName   = 'LightCraft*'
  silentArgs     = '/qn /norestart'
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
