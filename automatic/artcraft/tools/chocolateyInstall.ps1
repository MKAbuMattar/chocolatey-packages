$ErrorActionPreference = 'Stop'

# A per-machine install, so Chocolatey's auto-uninstaller finds it by product name.
# The Craft MSIs became dual-mode and install per user unless told ALLUSERS=1, which
# fails with 1603 beside an earlier per-machine copy.
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'MSI'
  url64          = 'https://github.com/storytold/artcraft/releases/download/artcraft-v0.41.1/ArtCraft_0.41.1_x64_en-US.msi'
  checksum64     = '450b15e53d8ccc9afde2d3644a547ab5f900167b837b861571ea4c833166417d'
  checksumType64 = 'sha256'
  softwareName   = 'ArtCraft*'
  silentArgs     = '/qn /norestart ALLUSERS=1'
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
