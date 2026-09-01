$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/dyad-sh/dyad/releases/download/v1.13.0/dyad-1.13.0.Setup.exe'
  checksum64     = '0a07fcfd955bab70cc1d52b1c74b8ded0bc85b36bbbeaf00cc002056a63f0677'
  checksumType64 = 'sha256'
  softwareName   = 'Dyad*'
  silentArgs     = '--silent'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
