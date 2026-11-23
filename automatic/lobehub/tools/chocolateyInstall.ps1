$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/lobehub/lobehub/releases/download/v2.3.5/LobeHub-2.3.5-setup.exe'
  checksum64     = '6d0c4fa202c762188e782ac9d34c2813d191a1b22c529718ad86ea006f57a598'
  checksumType64 = 'sha256'
  softwareName   = 'LobeHub*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
