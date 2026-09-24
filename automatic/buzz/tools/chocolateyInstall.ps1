$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/block/buzz/releases/download/desktop-v0.5.25/Buzz_0.5.25_x64-setup_alpha-unsigned.exe'
  checksum64     = 'fff84c9048acbb0592d873f6cc8c8cd9816c43a753042407bfa47b452c2bda43'
  checksumType64 = 'sha256'
  softwareName   = 'Buzz*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
