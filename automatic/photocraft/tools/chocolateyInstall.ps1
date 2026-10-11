$ErrorActionPreference = 'Stop'

# A per-machine MSI (ALLUSERS=1), so Chocolatey's auto-uninstaller finds it by product name.
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'MSI'
  url64          = 'https://github.com/storytold/photocraft/releases/download/v0.7.0/photocraft-0.7.0-windows-x64.msi'
  checksum64     = 'af959a169ba0b93bdcec4df0e9dfdbac365b7759d3d74b06c3f8f96ed45ff9a0'
  checksumType64 = 'sha256'
  softwareName   = 'PhotoCraft*'
  silentArgs     = '/qn /norestart'
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
