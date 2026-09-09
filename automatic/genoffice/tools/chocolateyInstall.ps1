$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/genspark-ai/genoffice/releases/download/v0.8.1039/GenOfficeSetup-v0.8.1039.exe'
  checksum64     = 'c3d5c82b1844ea8a9052b9e2e10948ec6a39f3ac6b62ab5fee367e0798b082b0'
  checksumType64 = 'sha256'
  softwareName   = 'GenOffice*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
