$ErrorActionPreference = 'Stop'

# A per-machine MSI (ALLUSERS=1), so Chocolatey's auto-uninstaller finds it by product name.
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'MSI'
  url64          = 'https://github.com/storytold/effectcraft/releases/download/v0.19.0/effectcraft-0.19.0-windows-x64.msi'
  checksum64     = 'd6cff47ec0df9731343b9c749537e87425921034259fd91a74f3ad976b10c910'
  checksumType64 = 'sha256'
  softwareName   = 'EffectCraft*'
  silentArgs     = '/qn /norestart'
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
