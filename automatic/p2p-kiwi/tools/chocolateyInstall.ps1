$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/dont-be-evil-company/p2p.kiwi/releases/download/v3.2.0/p2p-kiwi-setup_x64.exe'
  checksum64     = 'dce6197d39a9638cf55a8c52d6246a58b70e2b8f14fc9ce7a31e9cbed2b9ab9d'
  checksumType64 = 'sha256'
  softwareName   = 'p2p.kiwi*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
