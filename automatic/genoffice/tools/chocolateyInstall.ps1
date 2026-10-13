$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/genspark-ai/genoffice/releases/download/v0.11.727/GenOfficeSetup-v0.11.727-x64.exe'
  checksum64     = '55c410c10885c5b1b5c88851bd2933f99085397707e1d8a34a7ec1319ecf3dd5'
  checksumType64 = 'sha256'
  softwareName   = 'GenOffice*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
