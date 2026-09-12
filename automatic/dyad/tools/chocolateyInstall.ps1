$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/dyad-sh/dyad/releases/download/v1.15.0/dyad-1.15.0.Setup.exe'
  checksum64     = '18f41b021caabd381ae5562de6788d9ce1ab2612040f982bdd20adc090f998a7'
  checksumType64 = 'sha256'
  softwareName   = 'Dyad*'
  silentArgs     = '--silent'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
