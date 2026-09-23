$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/kortix-ai/suna/releases/download/v0.13.30/Kortix-Setup-0.13.30.exe'
  checksum64     = '2cffbf16edf00d25279a7b1c185d46705ed11e9a29cdb1dd169c3012ac4b0e92'
  checksumType64 = 'sha256'
  softwareName   = 'Kortix*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
