$ErrorActionPreference = 'Stop'

# A per-machine MSI (ALLUSERS=1), so Chocolatey's auto-uninstaller finds it by product name.
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'MSI'
  url64          = 'https://github.com/storytold/photocraft/releases/download/v0.9.0/photocraft-0.9.0-windows-x64.msi'
  checksum64     = '785c81a5fc78c9b683b0f9e6653c38f95b306a38303f60b391670a9e1ac590d4'
  checksumType64 = 'sha256'
  softwareName   = 'PhotoCraft*'
  silentArgs     = '/qn /norestart'
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
