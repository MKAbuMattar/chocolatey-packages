$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/block/buzz/releases/download/desktop-v0.5.9/Buzz_0.5.9_x64-setup_alpha-unsigned.exe'
  checksum64     = '070ccb1abad5f61d98e076b8edeeb2fdb9a590e65f541a07b5591a666af9eca4'
  checksumType64 = 'sha256'
  softwareName   = 'Buzz*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
