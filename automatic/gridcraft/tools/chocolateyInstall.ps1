$ErrorActionPreference = 'Stop'

# A per-machine install, so Chocolatey's auto-uninstaller finds it by product name.
# The Craft MSIs became dual-mode and install per user unless told ALLUSERS=1, which
# fails with 1603 beside an earlier per-machine copy.
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'MSI'
  url64          = 'https://github.com/storytold/gridcraft/releases/download/v0.16.0/gridcraft-0.16.0-windows-x64.msi'
  checksum64     = 'c5364482c42902605c1c29a317165d0e3c2eba55acbe0de15d97150def37b8de'
  checksumType64 = 'sha256'
  softwareName   = 'GridCraft*'
  silentArgs     = '/qn /norestart ALLUSERS=1'
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
