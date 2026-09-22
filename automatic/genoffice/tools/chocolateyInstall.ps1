$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/genspark-ai/genoffice/releases/download/v0.10.1038/GenOfficeSetup-v0.10.1038-x64.exe'
  checksum64     = 'c6fedfdee07a49a48484c05c65b4237c5c613e2ca77b2d4a7d78ccd9d90edfc3'
  checksumType64 = 'sha256'
  softwareName   = 'GenOffice*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
