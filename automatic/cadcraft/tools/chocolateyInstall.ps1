$ErrorActionPreference = 'Stop'

# A per-machine MSI (ALLUSERS=1), so Chocolatey's auto-uninstaller finds it by product name.
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'MSI'
  url64          = 'https://github.com/storytold/cadcraft/releases/download/v0.10.0/cadcraft-0.10.0-windows-x64.msi'
  checksum64     = '621444fc434f792eb815ed4d052bb492e4c924bf8a64d6224bc964fa5a480ff3'
  checksumType64 = 'sha256'
  softwareName   = 'CADCraft*'
  silentArgs     = '/qn /norestart'
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
