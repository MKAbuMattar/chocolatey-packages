$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/dont-be-evil-company/p2p.kiwi/releases/download/v1.0.0/p2p-kiwi-setup_x64.exe'
  checksum64     = '4f22e981c16d4f7ebb3164bbd7f689774f5b37830c748ac3473ef9d7120dc7ab'
  checksumType64 = 'sha256'
  softwareName   = 'Bananas*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
