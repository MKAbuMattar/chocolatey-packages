$ErrorActionPreference = 'Stop'

# A per-machine MSI (ALLUSERS=1), so Chocolatey's auto-uninstaller finds it by product name.
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'MSI'
  url64          = 'https://github.com/storytold/filmcraft/releases/download/v0.6.0/filmcraft-0.6.0-windows-x64.msi'
  checksum64     = '7cd23b18a719884ef8cd06a2dfb2e362fc165e03037c62a4548e900136ef8e9f'
  checksumType64 = 'sha256'
  softwareName   = 'FilmCraft*'
  silentArgs     = '/qn /norestart'
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
