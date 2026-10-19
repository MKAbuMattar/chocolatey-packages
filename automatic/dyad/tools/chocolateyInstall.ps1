$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/dyad-sh/dyad/releases/download/v1.20.0/dyad-1.20.0.Setup.exe'
  checksum64     = '9a5b026d1a1ea06bae067c732357a968be6efac6aea33da058a80c9dc2934440'
  checksumType64 = 'sha256'
  softwareName   = 'Dyad*'
  silentArgs     = '--silent'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
