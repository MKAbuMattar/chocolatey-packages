$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/kortix-ai/suna/releases/download/v0.13.9/Kortix-Setup-0.13.9.exe'
  checksum64     = '8cd9d4be02dd2c9673eba8c253f96a7db810c62a24f9e2cde1e09402c63ec3cb'
  checksumType64 = 'sha256'
  softwareName   = 'Kortix*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
