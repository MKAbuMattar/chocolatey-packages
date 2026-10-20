$ErrorActionPreference = 'Stop'

# A per-machine MSI (ALLUSERS=1), so Chocolatey's auto-uninstaller finds it by product name.
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'MSI'
  url64          = 'https://github.com/storytold/soundcraft/releases/download/v0.10.0/soundcraft-0.10.0-windows-x64.msi'
  checksum64     = '6c43c4f3ecee2384ecee0c4f615083fb2d04b4b13c7cb20e715509ec743154ae'
  checksumType64 = 'sha256'
  softwareName   = 'SoundCraft*'
  silentArgs     = '/qn /norestart'
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
