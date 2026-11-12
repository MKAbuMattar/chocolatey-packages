$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/genspark-ai/genoffice/releases/download/v0.13.18/GenOfficeSetup-v0.13.18-x64.exe'
  checksum64     = '1a8aedc94290fcc65ec51db70b8f50a7577fc1ef916ca1295b45e9edda28d072'
  checksumType64 = 'sha256'
  softwareName   = 'GenOffice*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
