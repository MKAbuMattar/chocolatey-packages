$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/genspark-ai/genoffice/releases/download/v0.12.852/GenOfficeSetup-v0.12.852-x64.exe'
  checksum64     = '403ffe05007ab2c55e668c1009e9957b64c0af9f679bd9ddf15060ddd8906a4d'
  checksumType64 = 'sha256'
  softwareName   = 'GenOffice*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
