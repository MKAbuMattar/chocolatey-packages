$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/kortix-ai/suna/releases/download/v0.13.14/Kortix-Setup-0.13.14.exe'
  checksum64     = 'bdeb3d7a3800adedab7c97f2ab736659acda5db99fe69b1fe6a3ce174fe66a01'
  checksumType64 = 'sha256'
  softwareName   = 'Kortix*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
