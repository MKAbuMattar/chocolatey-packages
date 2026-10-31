$ErrorActionPreference = 'Stop'

# A per-machine install, so Chocolatey's auto-uninstaller finds it by product name.
# The Craft MSIs became dual-mode and install per user unless told ALLUSERS=1, which
# fails with 1603 beside an earlier per-machine copy.
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'MSI'
  url64          = 'https://github.com/storytold/filmcraft/releases/download/v0.15.0/filmcraft-0.15.0-windows-x64.msi'
  checksum64     = '0daa5a22815659380fb77e649c4a7a7c1311a13e196eef011a59dca3458b1afd'
  checksumType64 = 'sha256'
  softwareName   = 'FilmCraft*'
  silentArgs     = '/qn /norestart ALLUSERS=1'
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
