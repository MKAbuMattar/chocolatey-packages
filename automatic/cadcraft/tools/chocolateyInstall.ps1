$ErrorActionPreference = 'Stop'

# A per-machine install, so Chocolatey's auto-uninstaller finds it by product name.
# The Craft MSIs became dual-mode and install per user unless told ALLUSERS=1, which
# fails with 1603 beside an earlier per-machine copy.
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'MSI'
  url64          = 'https://github.com/storytold/cadcraft/releases/download/v0.18.0/cadcraft-0.18.0-windows-x64.msi'
  checksum64     = '4fce1c652b540600bef1e4cab459614c112a27032ac48289aa2f013fd0dd425f'
  checksumType64 = 'sha256'
  softwareName   = 'CADCraft*'
  silentArgs     = '/qn /norestart ALLUSERS=1'
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
