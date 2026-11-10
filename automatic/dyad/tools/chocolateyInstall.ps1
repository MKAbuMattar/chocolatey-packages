$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/dyad-sh/dyad/releases/download/v1.23.0/dyad-1.23.0.Setup.exe'
  checksum64     = '23960f2df6ff7d2e5494a82a5dc24279d7bdbb801465a2512d900cd77180f678'
  checksumType64 = 'sha256'
  softwareName   = 'Dyad*'
  silentArgs     = '--silent'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
