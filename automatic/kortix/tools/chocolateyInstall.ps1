$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/kortix-ai/suna/releases/download/v0.14.8/Kortix-Setup-0.14.8.exe'
  checksum64     = 'a25152f90aa1a361f36bd2e283cac567c808be8833345e22e525b00b080d336e'
  checksumType64 = 'sha256'
  softwareName   = 'Kortix*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
