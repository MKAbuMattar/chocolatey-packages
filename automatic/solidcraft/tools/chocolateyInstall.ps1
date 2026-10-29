$ErrorActionPreference = 'Stop'

# A per-machine MSI (ALLUSERS=1), so Chocolatey's auto-uninstaller finds it by product name.
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'MSI'
  url64          = 'https://github.com/tangency-labs/solidcraft/releases/download/v0.26.1/solidcraft-0.26.1-windows-x64.msi'
  checksum64     = 'bcef243e92b734c6d1bb726dfda6496ff6c28180b1c3b54393359b57e04dc402'
  checksumType64 = 'sha256'
  softwareName   = 'SolidCraft*'
  silentArgs     = '/qn /norestart'
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
