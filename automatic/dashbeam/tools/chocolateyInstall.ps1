$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'MSI'
  url64          = 'https://github.com/tonyantony300/dashbeam/releases/download/v0.6.0/AltSendme_0.6.0_x64_en-US.msi'
  checksum64     = '60cd51052f813ff26c5478a550f2d03634ba5384661e2394d00222f0b8926635'
  checksumType64 = 'sha256'
  softwareName   = 'AltSendme*'
  silentArgs     = '/qn /norestart'
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
