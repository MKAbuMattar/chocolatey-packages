$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/block/buzz/releases/download/desktop-v0.5.23/Buzz_0.5.23_x64-setup_alpha-unsigned.exe'
  checksum64     = 'b9116e0a4a171a2ec2e72a46698d176ac1f2013ad66bce326a97e5e7c32d1553'
  checksumType64 = 'sha256'
  softwareName   = 'Buzz*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
