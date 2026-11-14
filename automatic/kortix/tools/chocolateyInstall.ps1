$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/kortix-ai/CompanyOS/releases/download/v0.15.11/Kortix-Setup-0.15.11.exe'
  checksum64     = '0d27adc5c3ebaea6ddcce5edb82c62efba73274804bff74f9ea9b5ca9d8f1000'
  checksumType64 = 'sha256'
  softwareName   = 'Kortix*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
