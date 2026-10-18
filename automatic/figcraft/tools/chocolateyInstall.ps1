$ErrorActionPreference = 'Stop'

# A per-machine MSI (ALLUSERS=1), so Chocolatey's auto-uninstaller finds it by product name.
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'MSI'
  url64          = 'https://github.com/storytold/figcraft/releases/download/v0.7.0/figcraft-0.7.0-windows-x64.msi'
  checksum64     = '897e1a2cec07e3cd6ffb024cccc7da4d3a2366c667f69ba539981b6f59051a6f'
  checksumType64 = 'sha256'
  softwareName   = 'FigCraft*'
  silentArgs     = '/qn /norestart'
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
