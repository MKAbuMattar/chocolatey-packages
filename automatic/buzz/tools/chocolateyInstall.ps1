$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/block/buzz/releases/download/desktop-v0.5.28/Buzz_0.5.28_x64-setup_alpha-unsigned.exe'
  checksum64     = 'dfecae208e81f6606efeacfb476e9947c9c14dfc6ba992742c57bb469d594b5d'
  checksumType64 = 'sha256'
  softwareName   = 'Buzz*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
