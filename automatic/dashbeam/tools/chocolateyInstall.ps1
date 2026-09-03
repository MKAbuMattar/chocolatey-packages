$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'MSI'
  url64          = 'https://github.com/tonyantony300/dashbeam/releases/download/v0.7.1/DashBeam_0.7.1_x64_en-US.msi'
  checksum64     = '624477c2f237dbddfb5b1e04fd7e5e0bc6004e660543cf9e6377f44b9dc3f4b4'
  checksumType64 = 'sha256'
  softwareName   = 'DashBeam*'
  silentArgs     = '/qn /norestart'
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
