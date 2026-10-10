$ErrorActionPreference = 'Stop'

# A per-machine MSI (ALLUSERS=1), so Chocolatey's auto-uninstaller finds it by product name.
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'MSI'
  url64          = 'https://github.com/storytold/designcraft/releases/download/v0.5.0/designcraft-0.5.0-windows-x64.msi'
  checksum64     = '7dc8e40a18395b31c2b8a2a7c9cf71c163fa97d99f38067ddcce53bea7c0d2b4'
  checksumType64 = 'sha256'
  softwareName   = 'DesignCraft*'
  silentArgs     = '/qn /norestart'
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
