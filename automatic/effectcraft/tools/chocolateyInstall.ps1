$ErrorActionPreference = 'Stop'

# A per-machine install, so Chocolatey's auto-uninstaller finds it by product name.
# The Craft MSIs became dual-mode and install per user unless told ALLUSERS=1, which
# fails with 1603 beside an earlier per-machine copy.
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'MSI'
  url64          = 'https://github.com/storytold/effectcraft/releases/download/v0.24.0/effectcraft-0.24.0-windows-x64.msi'
  checksum64     = '6556f19dff15142b432852301b39c698bd2f0e619177cb60a360caf8b9f40314'
  checksumType64 = 'sha256'
  softwareName   = 'EffectCraft*'
  silentArgs     = '/qn /norestart ALLUSERS=1'
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
