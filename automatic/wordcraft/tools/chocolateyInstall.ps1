$ErrorActionPreference = 'Stop'

# A per-machine MSI (ALLUSERS=1), so Chocolatey's auto-uninstaller finds it by product name.
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'MSI'
  url64          = 'https://github.com/storytold/wordcraft/releases/download/v0.3.0/wordcraft-0.3.0-windows-x64.msi'
  checksum64     = '9ef44bc198d361f30ad986bf056c4d255df032d3cb1b5ab23a75de2b20a7de0c'
  checksumType64 = 'sha256'
  softwareName   = 'WordCraft*'
  silentArgs     = '/qn /norestart'
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
