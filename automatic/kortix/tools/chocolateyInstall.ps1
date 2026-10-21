$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/kortix-ai/suna/releases/download/v0.14.4/Kortix-Setup-0.14.4.exe'
  checksum64     = '49c74b7bdfbc9ab6b182d8ea53669a1dd52464c3b4e222520493eae40e3a89a3'
  checksumType64 = 'sha256'
  softwareName   = 'Kortix*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
