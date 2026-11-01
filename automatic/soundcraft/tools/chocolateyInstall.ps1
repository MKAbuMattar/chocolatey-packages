$ErrorActionPreference = 'Stop'

# A per-machine install, so Chocolatey's auto-uninstaller finds it by product name.
# The Craft MSIs became dual-mode and install per user unless told ALLUSERS=1, which
# fails with 1603 beside an earlier per-machine copy.
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'MSI'
  url64          = 'https://github.com/storytold/soundcraft/releases/download/v0.16.0/soundcraft-0.16.0-windows-x64.msi'
  checksum64     = 'ebc22dc279bbf4376a7d94384cbfb703e60376ce7b661fef0c73ab62bce1b086'
  checksumType64 = 'sha256'
  softwareName   = 'SoundCraft*'
  silentArgs     = '/qn /norestart ALLUSERS=1'
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
