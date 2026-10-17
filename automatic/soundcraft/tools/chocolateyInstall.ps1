$ErrorActionPreference = 'Stop'

# A per-machine MSI (ALLUSERS=1), so Chocolatey's auto-uninstaller finds it by product name.
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'MSI'
  url64          = 'https://github.com/storytold/soundcraft/releases/download/v0.8.0/soundcraft-0.8.0-windows-x64.msi'
  checksum64     = 'cf7fc07f9d1cf7cd31c0c8c2bef79c6a2e477e23fec4ecefa1cadb21b4db6ded'
  checksumType64 = 'sha256'
  softwareName   = 'SoundCraft*'
  silentArgs     = '/qn /norestart'
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
