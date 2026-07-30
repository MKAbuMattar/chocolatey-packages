$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/onlook-dev/onlook/releases/download/v0.2.32/Onlook-setup.exe'
  checksum64     = '88ce6b5ec85fb971c65b2403f984cf20d1647c3a6f3501c31b125fd9d1753656'
  checksumType64 = 'sha256'
  softwareName   = 'Onlook*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
