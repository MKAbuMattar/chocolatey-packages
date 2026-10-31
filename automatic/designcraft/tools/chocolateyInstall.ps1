$ErrorActionPreference = 'Stop'

# A per-machine MSI (ALLUSERS=1), so Chocolatey's auto-uninstaller finds it by product name.
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'MSI'
  url64          = 'https://github.com/storytold/designcraft/releases/download/v0.15.2/designcraft-0.15.2-windows-x64.msi'
  checksum64     = '05b56bd0fe0defb054b7c38f81b30ad90093c5d353435e54c567e99a6e326925'
  checksumType64 = 'sha256'
  softwareName   = 'DesignCraft*'
  silentArgs     = '/qn /norestart'
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
