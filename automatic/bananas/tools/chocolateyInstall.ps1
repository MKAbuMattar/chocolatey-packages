$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/mistweaverco/bananas/releases/download/v0.2.1/bananas-setup_x64.exe'
  checksum64     = 'b09f385f120f1960160f8ed512af0280b4d8701b32f0e92b8745120b96cf7c61'
  checksumType64 = 'sha256'
  softwareName   = 'Bananas*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
