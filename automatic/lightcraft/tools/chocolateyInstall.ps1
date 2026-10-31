$ErrorActionPreference = 'Stop'

# A per-machine MSI (ALLUSERS=1), so Chocolatey's auto-uninstaller finds it by product name.
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'MSI'
  url64          = 'https://github.com/storytold/lightcraft/releases/download/v0.16.0/lightcraft-0.16.0-windows-x64.msi'
  checksum64     = '6133f27569668fa473807b4db29ef6f02bba3730b0c5b4de6a059fcde14d7498'
  checksumType64 = 'sha256'
  softwareName   = 'LightCraft*'
  silentArgs     = '/qn /norestart'
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
