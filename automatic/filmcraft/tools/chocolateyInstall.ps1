$ErrorActionPreference = 'Stop'

# A per-machine install, so Chocolatey's auto-uninstaller finds it by product name.
# The Craft MSIs became dual-mode and install per user unless told ALLUSERS=1, which
# fails with 1603 beside an earlier per-machine copy.
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'MSI'
  url64          = 'https://github.com/storytold/filmcraft/releases/download/v0.16.0/filmcraft-0.16.0-windows-x64.msi'
  checksum64     = '5dd137a74867d795ebe3f71bda1e8b83055a28b99275306e6ec9a48e8291175f'
  checksumType64 = 'sha256'
  softwareName   = 'FilmCraft*'
  silentArgs     = '/qn /norestart ALLUSERS=1'
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
