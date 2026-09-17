$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/kortix-ai/suna/releases/download/v0.13.21/Kortix-Setup-0.13.21.exe'
  checksum64     = '1b8e96b7330439c77f4453634de8e1d13d1b94372f72e0f48b2a5c63cc66977e'
  checksumType64 = 'sha256'
  softwareName   = 'Kortix*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
