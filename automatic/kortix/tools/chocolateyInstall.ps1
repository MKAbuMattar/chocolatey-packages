$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/kortix-ai/suna/releases/download/v0.13.24/Kortix-Setup-0.13.24.exe'
  checksum64     = '59ca67b1658c7aa513dc4d5df78f60ce3fe8ce4ab8c91dc7a13e52f8d147b9e1'
  checksumType64 = 'sha256'
  softwareName   = 'Kortix*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
