$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/dont-be-evil-company/p2p.kiwi/releases/download/v3.9.1/p2p-kiwi-setup_x64.exe'
  checksum64     = 'b027541af836314914476056f7e23ac52b9c62044bc6898c270d6118869958b8'
  checksumType64 = 'sha256'
  softwareName   = 'p2p.kiwi*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
