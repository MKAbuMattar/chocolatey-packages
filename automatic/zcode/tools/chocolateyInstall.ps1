$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/zai-org/ZCode/releases/download/v4.0.0/ZCode-4.0.0-win-x64.exe'
  checksum64     = 'ec616a2b691b571396e4f143f9b35e7e48d95bf58d12d9ded59db9ea6624625b'
  checksumType64 = 'sha256'
  softwareName   = 'ZCode*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
