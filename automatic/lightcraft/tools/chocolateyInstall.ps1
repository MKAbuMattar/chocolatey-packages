$ErrorActionPreference = 'Stop'

# A per-machine install, so Chocolatey's auto-uninstaller finds it by product name.
# The Craft MSIs became dual-mode and install per user unless told ALLUSERS=1, which
# fails with 1603 beside an earlier per-machine copy.
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'MSI'
  url64          = 'https://github.com/storytold/lightcraft/releases/download/v0.19.0/lightcraft-0.19.0-windows-x64.msi'
  checksum64     = '1779180b574538b65106345ab63b6f03b1678562694e9b7150a6eba26cbeb474'
  checksumType64 = 'sha256'
  softwareName   = 'LightCraft*'
  silentArgs     = '/qn /norestart ALLUSERS=1'
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
