$ErrorActionPreference = 'Stop'

# A per-machine install, so Chocolatey's auto-uninstaller finds it by product name.
# The Craft MSIs became dual-mode and install per user unless told ALLUSERS=1, which
# fails with 1603 beside an earlier per-machine copy.
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'MSI'
  url64          = 'https://github.com/storytold/texturecraft/releases/download/v0.6.1/texturecraft-0.6.1-windows-x64.msi'
  checksum64     = 'c06fb85f81a1568b02d50bdacea197450a18825f1d113f2d0c88d9cdd1462eed'
  checksumType64 = 'sha256'
  softwareName   = 'TextureCraft*'
  silentArgs     = '/qn /norestart ALLUSERS=1'
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
