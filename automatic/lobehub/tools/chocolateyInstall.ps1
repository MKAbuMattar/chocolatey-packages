$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/lobehub/lobehub/releases/download/v2.2.19/LobeHub-2.2.19-setup.exe'
  checksum64     = 'd7a28eb3d4746a097bda2c9205bd7118aa14b537f8aded2594dac4023eee27d7'
  checksumType64 = 'sha256'
  softwareName   = 'LobeHub*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
