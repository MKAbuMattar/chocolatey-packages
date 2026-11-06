$ErrorActionPreference = 'Stop'

# A per-machine install, so Chocolatey's auto-uninstaller finds it by product name.
# The Craft MSIs became dual-mode and install per user unless told ALLUSERS=1, which
# fails with 1603 beside an earlier per-machine copy.
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'MSI'
  url64          = 'https://github.com/storytold/filmcraft/releases/download/v0.18.0/filmcraft-0.18.0-windows-x64.msi'
  checksum64     = '5c47b24c1f0c013f24c65e81ee2d46308d6a9c728bef78af5df0f939fe70c5b7'
  checksumType64 = 'sha256'
  softwareName   = 'FilmCraft*'
  silentArgs     = '/qn /norestart ALLUSERS=1'
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
