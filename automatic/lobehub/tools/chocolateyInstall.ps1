$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/lobehub/lobehub/releases/download/v2.3.4/LobeHub-2.3.4-setup.exe'
  checksum64     = 'c9e8477c1d5c45c2748669b36d03cc4f4e156990cba86fb69351ba449cf7eb39'
  checksumType64 = 'sha256'
  softwareName   = 'LobeHub*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
