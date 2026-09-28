$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/dyad-sh/dyad/releases/download/v1.17.0/dyad-1.17.0.Setup.exe'
  checksum64     = 'a184dee35e6c3ffb497f53a96d96feee3b0f23561e1decf3ef97d06b3d48631e'
  checksumType64 = 'sha256'
  softwareName   = 'Dyad*'
  silentArgs     = '--silent'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
