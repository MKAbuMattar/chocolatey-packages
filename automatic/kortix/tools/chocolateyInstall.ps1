$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/kortix-ai/suna/releases/download/v0.13.38/Kortix-Setup-0.13.38.exe'
  checksum64     = 'f1eb29fcc4ef61491cf3ce4cbb3f7a001b4da114a5219f38e803bbdab3c63506'
  checksumType64 = 'sha256'
  softwareName   = 'Kortix*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
