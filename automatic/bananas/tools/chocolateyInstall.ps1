$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/mistweaverco/bananas/releases/download/v0.0.22/bananas-setup_x64.exe'
  checksum64     = '282ec4f04eff2136d405be0fd4b2b9d71ca6307849890f5d611b41a830bb0d08'
  checksumType64 = 'sha256'
  softwareName   = 'Bananas*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
