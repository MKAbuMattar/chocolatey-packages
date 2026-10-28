$ErrorActionPreference = 'Stop'

# A per-machine MSI (ALLUSERS=1), so Chocolatey's auto-uninstaller finds it by product name.
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'MSI'
  url64          = 'https://github.com/tangency-labs/solidcraft/releases/download/v0.25.1/solidcraft-0.25.1-windows-x64.msi'
  checksum64     = '477e01295c954c82f9bc1ead2003dcd28c174ceffbc5a313696fcf7c49b4787e'
  checksumType64 = 'sha256'
  softwareName   = 'SolidCraft*'
  silentArgs     = '/qn /norestart'
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
