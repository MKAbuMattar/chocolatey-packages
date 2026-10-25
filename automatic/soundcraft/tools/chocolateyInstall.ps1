$ErrorActionPreference = 'Stop'

# A per-machine MSI (ALLUSERS=1), so Chocolatey's auto-uninstaller finds it by product name.
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'MSI'
  url64          = 'https://github.com/storytold/soundcraft/releases/download/v0.13.1/soundcraft-0.13.1-windows-x64.msi'
  checksum64     = 'aabdad1afbf3b3717e77304e92d2c86ca3d141505f46612fa5300f2db00ea965'
  checksumType64 = 'sha256'
  softwareName   = 'SoundCraft*'
  silentArgs     = '/qn /norestart'
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
