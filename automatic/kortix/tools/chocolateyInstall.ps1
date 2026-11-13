$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/kortix-ai/CompanyOS/releases/download/v0.15.10/Kortix-Setup-0.15.10.exe'
  checksum64     = '5ff28020292d43646873b1a2b63ff041df8f79b895a81aaa8008bca3f1bb1494'
  checksumType64 = 'sha256'
  softwareName   = 'Kortix*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
