$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/kortix-ai/suna/releases/download/v0.13.50/Kortix-Setup-0.13.50.exe'
  checksum64     = '495e62e7a1add9bcf1186e954a1af4f86873db4fcf1dd45fc3e3c5b6bdf3bdcd'
  checksumType64 = 'sha256'
  softwareName   = 'Kortix*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
