$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/dont-be-evil-company/p2p.kiwi/releases/download/v3.3.0/p2p-kiwi-setup_x64.exe'
  checksum64     = '0319228eaedff0ec8c55e0f0213cebffdd8ef79c9defcd6fa4c5c9722b7bfb81'
  checksumType64 = 'sha256'
  softwareName   = 'Bananas*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
