$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/different-ai/openwork/releases/download/v0.18.59/openwork-win-x64-0.18.59.exe'
  checksum64     = '02b9b788b7299295133c58e7fe1a409e9a9b7676ccc3c525d8bc3d90498feb2e'
  checksumType64 = 'sha256'
  softwareName   = 'Openwork*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
