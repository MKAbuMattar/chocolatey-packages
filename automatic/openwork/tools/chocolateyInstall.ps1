$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/different-ai/openwork/releases/download/v0.18.41/openwork-win-x64-0.18.41.exe'
  checksum64     = 'df1c5fd301a41b9d871ab4b4ff12af127474ff7f3b245c0e4c3d1ed6eed0382f'
  checksumType64 = 'sha256'
  softwareName   = 'Openwork*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
