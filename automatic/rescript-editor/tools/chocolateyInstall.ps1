$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/wassgha/rescript/releases/download/v1.2.5/Rescript-Setup.exe'
  checksum64     = 'caaf2e80804036f76469c90456871f41b2d3ab95951ed68b92a4a39db95c89e2'
  checksumType64 = 'sha256'
  softwareName   = 'Rescript*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
