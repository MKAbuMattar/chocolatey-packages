$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'MSI'
  url64          = 'https://github.com/novincode/dlman/releases/download/v1.12.0/DLMan_1.11.1_x64_en-US.msi'
  checksum64     = '99a6647a56f09b6bc6f62f75e0c25004d0de6a511e0b2d5ca1fca2227159330d'
  checksumType64 = 'sha256'
  softwareName   = 'DLMan*'
  silentArgs     = '/qn /norestart'
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
