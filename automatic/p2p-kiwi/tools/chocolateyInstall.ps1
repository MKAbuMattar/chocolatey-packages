$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/dont-be-evil-company/p2p.kiwi/releases/download/v3.7.0/p2p-kiwi-setup_x64.exe'
  checksum64     = '937aca23eb118e817d18f1c03f778156bb5237a6e520ef0d8158bc1a3217c054'
  checksumType64 = 'sha256'
  softwareName   = 'p2p.kiwi*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
