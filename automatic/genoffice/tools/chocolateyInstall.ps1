$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/genspark-ai/genoffice/releases/download/v0.10.1467/GenOfficeSetup-v0.10.1467-x64.exe'
  checksum64     = 'f349480de07768575a80fd09aa542a4dd5cccc7c432fd641ccac65cdb5e70e73'
  checksumType64 = 'sha256'
  softwareName   = 'GenOffice*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
