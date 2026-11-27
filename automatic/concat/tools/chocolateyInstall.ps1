$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'MSI'
  url64          = 'https://github.com/jub0t/Concat/releases/download/v0.2.13/Concat-0.2.13-windows-x86_64.msi'
  checksum64     = 'c4548f520d385e0c59f6881d3caff2d582f67da26dd4a9dad85ad89f110ffe4d'
  checksumType64 = 'sha256'
  softwareName   = 'Concat*'
  silentArgs     = '/qn /norestart'
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
