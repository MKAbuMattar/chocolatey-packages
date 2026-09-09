$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/dyad-sh/dyad/releases/download/v1.14.0/dyad-1.14.0.Setup.exe'
  checksum64     = 'b3861ab3e305e4e768b074fa83b7277d06039453c7de92794be7b16962e55ad6'
  checksumType64 = 'sha256'
  softwareName   = 'Dyad*'
  silentArgs     = '--silent'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
