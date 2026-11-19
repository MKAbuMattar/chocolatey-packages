$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/kortix-ai/CompanyOS/releases/download/v0.16.0/Kortix-Setup-0.16.0.exe'
  checksum64     = '939955c3530d5eafab9f463d44dbeec0414b9528da17f62933e6ac9fd3425067'
  checksumType64 = 'sha256'
  softwareName   = 'Kortix*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
