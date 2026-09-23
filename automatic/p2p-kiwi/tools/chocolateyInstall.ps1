$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/dont-be-evil-company/p2p.kiwi/releases/download/v3.4.0/p2p-kiwi-setup_x64.exe'
  checksum64     = '54b65f15ebdb9bfd590bfb19068d86619298620ee3d684d92f3aaf285e67f4fa'
  checksumType64 = 'sha256'
  softwareName   = 'p2p.kiwi*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
