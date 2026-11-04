$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/zai-org/ZCode/releases/download/v3.17.2/ZCode-3.17.2-win-x64.exe'
  checksum64     = '2466b25b747918a8bdf8a2ef71419e377ede60541e9e8f3c88771de07855dc3d'
  checksumType64 = 'sha256'
  softwareName   = 'ZCode*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
