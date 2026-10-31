$ErrorActionPreference = 'Stop'

# A per-machine install, so Chocolatey's auto-uninstaller finds it by product name.
# The Craft MSIs became dual-mode and install per user unless told ALLUSERS=1, which
# fails with 1603 beside an earlier per-machine copy.
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'MSI'
  url64          = 'https://github.com/storytold/vectorcraft/releases/download/v0.19.0/vectorcraft-0.19.0-windows-x64.msi'
  checksum64     = 'ee96823769c2363dcc05b2dcdf7b0e7935c355676d427a8a17f4e48dcd95c004'
  checksumType64 = 'sha256'
  softwareName   = 'VectorCraft*'
  silentArgs     = '/qn /norestart ALLUSERS=1'
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
