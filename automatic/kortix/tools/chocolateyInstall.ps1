$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/kortix-ai/CompanyOS/releases/download/v0.15.1/Kortix-Setup-0.15.1.exe'
  checksum64     = 'cd239c261f11421c6a93b4c0d1d2a59d08f06dcfd56001bd4f6e3e41b91910be'
  checksumType64 = 'sha256'
  softwareName   = 'Kortix*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
