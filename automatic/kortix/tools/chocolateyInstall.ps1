$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/kortix-ai/suna/releases/download/v0.14.14/Kortix-Setup-0.14.14.exe'
  checksum64     = 'beff0408a88a1a7a4517f0d4fb429f3b542c60b74f6a792ddf173bdbe18e7cc9'
  checksumType64 = 'sha256'
  softwareName   = 'Kortix*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
