$ErrorActionPreference = 'Stop'

# A per-machine install, so Chocolatey's auto-uninstaller finds it by product name.
# The Craft MSIs became dual-mode and install per user unless told ALLUSERS=1, which
# fails with 1603 beside an earlier per-machine copy.
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'MSI'
  url64          = 'https://github.com/storytold/texturecraft/releases/download/v0.6.0/texturecraft-0.6.0-windows-x64.msi'
  checksum64     = '9da7b303ac4027c2972aad655b9c89b294bb70c23758962f3a31310c8e8339d0'
  checksumType64 = 'sha256'
  softwareName   = 'TextureCraft*'
  silentArgs     = '/qn /norestart ALLUSERS=1'
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
