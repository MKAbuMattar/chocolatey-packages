$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/lobehub/lobehub/releases/download/v2.3.3/LobeHub-2.3.3-setup.exe'
  checksum64     = '5d50dbd64e1282b99bfea3ee0b82b3ba4bdeb72a65d3a2b25b27fb9ee5744d1a'
  checksumType64 = 'sha256'
  softwareName   = 'LobeHub*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
