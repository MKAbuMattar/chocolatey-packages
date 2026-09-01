$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/different-ai/openwork/releases/download/v0.18.40/openwork-win-x64-0.18.40.exe'
  checksum64     = 'f010c42f1c06cfd12e6c158a0f3b6b5c18516f956f3fdb1dccea0bceda48b9da'
  checksumType64 = 'sha256'
  softwareName   = 'Openwork*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
