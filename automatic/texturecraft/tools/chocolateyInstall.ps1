$ErrorActionPreference = 'Stop'

# A per-machine install, so Chocolatey's auto-uninstaller finds it by product name.
# The Craft MSIs became dual-mode and install per user unless told ALLUSERS=1, which
# fails with 1603 beside an earlier per-machine copy.
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'MSI'
  url64          = 'https://github.com/storytold/texturecraft/releases/download/v0.5.0/texturecraft-0.5.0-windows-x64.msi'
  checksum64     = '28538f55af61c8300758fd4afc9d45b64700e5802aca4eba95576f619e6f3163'
  checksumType64 = 'sha256'
  softwareName   = 'TextureCraft*'
  silentArgs     = '/qn /norestart ALLUSERS=1'
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
