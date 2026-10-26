$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/genspark-ai/genoffice/releases/download/v0.12.115/GenOfficeSetup-v0.12.115-x64.exe'
  checksum64     = '805103b729aa6cde2a8ee249200e795b8177b5e0ad2ad012681057cc49d0231e'
  checksumType64 = 'sha256'
  softwareName   = 'GenOffice*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
