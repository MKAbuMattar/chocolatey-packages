$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/block/buzz/releases/download/desktop-v0.5.26/Buzz_0.5.26_x64-setup_alpha-unsigned.exe'
  checksum64     = 'df0b5412a786678f0dc76d8949c40569b3707ff10340b186b254388dac08f101'
  checksumType64 = 'sha256'
  softwareName   = 'Buzz*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
