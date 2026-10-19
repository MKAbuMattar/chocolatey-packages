$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/genspark-ai/genoffice/releases/download/v0.11.919/GenOfficeSetup-v0.11.919-x64.exe'
  checksum64     = 'f0925fe0f3a074039fbe37e40a9767f79eb66d3189b30ab927dd68eea39d655e'
  checksumType64 = 'sha256'
  softwareName   = 'GenOffice*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
