$ErrorActionPreference = 'Stop'

# A per-machine MSI (ALLUSERS=1), so Chocolatey's auto-uninstaller finds it by product name.
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'MSI'
  url64          = 'https://github.com/storytold/printcraft/releases/download/v0.2.1/printcraft-0.2.1-windows-x64.msi'
  checksum64     = '35408d34f23fbb1224251a95d04a4a7c3472f24faa6609ba8c953f4d46fcc6cf'
  checksumType64 = 'sha256'
  softwareName   = 'PrintCraft*'
  silentArgs     = '/qn /norestart'
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
