$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'MSI'
  url64          = 'https://github.com/tonyantony300/dashbeam/releases/download/v0.7.2/DashBeam_0.7.2_x64_en-US.msi'
  checksum64     = 'a6d28e153590117665745a92be03539476e41062da0d5b3ab9e89e10c05a31ac'
  checksumType64 = 'sha256'
  softwareName   = 'DashBeam*'
  silentArgs     = '/qn /norestart'
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
