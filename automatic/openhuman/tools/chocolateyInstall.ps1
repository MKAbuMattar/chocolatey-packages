$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'MSI'
  url64          = 'https://github.com/tinyhumansai/openhuman/releases/download/v0.64.14/OpenHuman_0.64.14_x64_en-US.msi'
  checksum64     = '1e16d26ca390577fa7325657616b0b2031aca077e983ad4e327d5dafbb5d09fd'
  checksumType64 = 'sha256'
  softwareName   = 'OpenHuman*'
  silentArgs     = '/qn /norestart'
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
