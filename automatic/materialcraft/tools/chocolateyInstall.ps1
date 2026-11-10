$ErrorActionPreference = 'Stop'

# A per-machine install, so Chocolatey's auto-uninstaller finds it by product name.
# The Craft MSIs became dual-mode and install per user unless told ALLUSERS=1, which
# fails with 1603 beside an earlier per-machine copy.
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'MSI'
  url64          = 'https://github.com/storytold/materialcraft/releases/download/v0.3.0/materialcraft-0.3.0-windows-x64.msi'
  checksum64     = '6096c3a75f074bc4426fc5e94c1c4db354bc316060a27ffb20fecf569a83bb12'
  checksumType64 = 'sha256'
  softwareName   = 'MaterialCraft*'
  silentArgs     = '/qn /norestart ALLUSERS=1'
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
