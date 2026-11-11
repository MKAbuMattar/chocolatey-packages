$ErrorActionPreference = 'Stop'

# A per-machine install, so Chocolatey's auto-uninstaller finds it by product name.
# The Craft MSIs became dual-mode and install per user unless told ALLUSERS=1, which
# fails with 1603 beside an earlier per-machine copy.
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'MSI'
  url64          = 'https://github.com/storytold/materialcraft/releases/download/v0.4.0/materialcraft-0.4.0-windows-x64.msi'
  checksum64     = '5d130af5b35dd05bd2edaa15e4716011d3965a9c273f6b86157413fc821dea5b'
  checksumType64 = 'sha256'
  softwareName   = 'MaterialCraft*'
  silentArgs     = '/qn /norestart ALLUSERS=1'
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
