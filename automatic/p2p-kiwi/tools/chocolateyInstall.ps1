$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/dont-be-evil-company/p2p.kiwi/releases/download/v3.10.0/p2p-kiwi-setup_x64.exe'
  checksum64     = '288c1c4ac4e4efcb1674aede31cddb95567837e0afd8e3596323f305709d866a'
  checksumType64 = 'sha256'
  softwareName   = 'p2p.kiwi*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
