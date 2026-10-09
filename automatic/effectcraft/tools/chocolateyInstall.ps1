$ErrorActionPreference = 'Stop'

# A per-machine MSI (ALLUSERS=1), so Chocolatey's auto-uninstaller finds it by product name.
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'MSI'
  url64          = 'https://github.com/storytold/effectcraft/releases/download/v0.6.0/effectcraft-0.6.0-windows-x64.msi'
  checksum64     = 'a3b5448d27eba599e22a11b9d6ccf38afb206dab26eb2b980148900020e2bbc7'
  checksumType64 = 'sha256'
  softwareName   = 'EffectCraft*'
  silentArgs     = '/qn /norestart'
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
