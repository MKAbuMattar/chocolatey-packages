$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/genspark-ai/genoffice/releases/download/v0.11.0/GenOfficeSetup-v0.11.0-x64.exe'
  checksum64     = '26ae7bc2c8cabe648cf2ed5d9da35ed7501769e900f1ea7c25de1972bf646508'
  checksumType64 = 'sha256'
  softwareName   = 'GenOffice*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
