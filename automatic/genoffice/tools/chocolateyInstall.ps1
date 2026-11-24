$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/genspark-ai/genoffice/releases/download/v0.13.886/GenOfficeSetup-v0.13.886-x64.exe'
  checksum64     = '331cc44fd22ee67aca9d033180cfd53c1a961fbfd42a3ac201018cd27a29531a'
  checksumType64 = 'sha256'
  softwareName   = 'GenOffice*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
