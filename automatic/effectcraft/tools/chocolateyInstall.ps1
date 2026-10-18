$ErrorActionPreference = 'Stop'

# A per-machine MSI (ALLUSERS=1), so Chocolatey's auto-uninstaller finds it by product name.
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'MSI'
  url64          = 'https://github.com/storytold/effectcraft/releases/download/v0.11.1/effectcraft-0.11.1-windows-x64.msi'
  checksum64     = 'c712bdf9c0c84c3427ff449465a1814639805f35a816f0f78ec6ff49aabd4245'
  checksumType64 = 'sha256'
  softwareName   = 'EffectCraft*'
  silentArgs     = '/qn /norestart'
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
