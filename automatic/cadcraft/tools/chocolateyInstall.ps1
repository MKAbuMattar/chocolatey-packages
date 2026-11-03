$ErrorActionPreference = 'Stop'

# A per-machine install, so Chocolatey's auto-uninstaller finds it by product name.
# The Craft MSIs became dual-mode and install per user unless told ALLUSERS=1, which
# fails with 1603 beside an earlier per-machine copy.
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'MSI'
  url64          = 'https://github.com/storytold/cadcraft/releases/download/v0.17.0/cadcraft-0.17.0-windows-x64.msi'
  checksum64     = '0d09274a7a8c2b34935edb3151a2e1f4f499160052f06e9d3c8b112d091d943e'
  checksumType64 = 'sha256'
  softwareName   = 'CADCraft*'
  silentArgs     = '/qn /norestart ALLUSERS=1'
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
