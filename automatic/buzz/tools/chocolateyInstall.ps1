$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/block/buzz/releases/download/desktop-v0.5.27/Buzz_0.5.27_x64-setup_alpha-unsigned.exe'
  checksum64     = '4e25bdc472cd8a06b0c085e7a313650821b438ecc762076e3e87fa4da79cb460'
  checksumType64 = 'sha256'
  softwareName   = 'Buzz*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
