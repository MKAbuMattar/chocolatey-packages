$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/block/buzz/releases/download/desktop-v0.5.24/Buzz_0.5.24_x64-setup_alpha-unsigned.exe'
  checksum64     = '38a9be91d547c177f9d69d801b09e73b27aa600dad43f1e9abaaa8dc3ceb70c6'
  checksumType64 = 'sha256'
  softwareName   = 'Buzz*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
