$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/dyad-sh/dyad/releases/download/v1.16.0/dyad-1.16.0.Setup.exe'
  checksum64     = '79037fe64a094ad4dd303a6b6e9fd8d5fa44d1c7085a563ff1af52645e7eaaf6'
  checksumType64 = 'sha256'
  softwareName   = 'Dyad*'
  silentArgs     = '--silent'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
