$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/lobehub/lobehub/releases/download/v2.2.17/LobeHub-2.2.17-setup.exe'
  checksum64     = 'f7226ef1c206b143bb7ba50174f13249082c0963be1235eaf8235b4aa3f6e80f'
  checksumType64 = 'sha256'
  softwareName   = 'LobeHub*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
