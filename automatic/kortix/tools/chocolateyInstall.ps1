$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/kortix-ai/suna/releases/download/v0.13.23/Kortix-Setup-0.13.23.exe'
  checksum64     = 'eb943b13671c785ade7e0851e15fcfb944b32549b7be8396794c36d5267fd4c0'
  checksumType64 = 'sha256'
  softwareName   = 'Kortix*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
