$ErrorActionPreference = 'Stop'

# A per-machine MSI (ALLUSERS=1), so Chocolatey's auto-uninstaller finds it by product name.
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'MSI'
  url64          = 'https://github.com/storytold/vectorcraft/releases/download/v0.15.0/vectorcraft-0.15.0-windows-x64.msi'
  checksum64     = '1dcba92d3ccbd758ed27df294081350a2a5192557e7af61df41f7ae0a5fa58c0'
  checksumType64 = 'sha256'
  softwareName   = 'VectorCraft*'
  silentArgs     = '/qn /norestart'
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
