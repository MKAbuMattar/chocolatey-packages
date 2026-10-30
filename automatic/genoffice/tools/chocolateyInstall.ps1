$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/genspark-ai/genoffice/releases/download/v0.12.446/GenOfficeSetup-v0.12.446-x64.exe'
  checksum64     = 'f803a7f29aadad9eba2b0e5acaff6bd6759e70c760f213de95068c8fb3fb8895'
  checksumType64 = 'sha256'
  softwareName   = 'GenOffice*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
