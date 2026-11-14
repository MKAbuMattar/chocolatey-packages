$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/block/buzz/releases/download/desktop-v0.5.30/Buzz_0.5.30_x64-setup_alpha-unsigned.exe'
  checksum64     = '50365b26e51771d09124d20743c26e660be54953f3823420233dab2ef062cafd'
  checksumType64 = 'sha256'
  softwareName   = 'Buzz*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
