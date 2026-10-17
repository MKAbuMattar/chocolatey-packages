$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/kortix-ai/suna/releases/download/v0.14.1/Kortix-Setup-0.14.1.exe'
  checksum64     = '13202e7251a81cbb9f1e11fb2cfa378ede5afc9eaf5189fb882becf2d5bed49e'
  checksumType64 = 'sha256'
  softwareName   = 'Kortix*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
