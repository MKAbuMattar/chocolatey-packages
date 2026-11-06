$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://mimocode-cdn.xiaomimimo.com/mimocode/mimodesktopai/XiaomiMiMo-AI-26.1106.61620-x64-setup.exe'
  checksum64     = 'da1400b668518e5b060c8a48927d877247c31bdb80260d579b460e3370494a9a'
  checksumType64 = 'sha256'
  softwareName   = 'Xiaomi MiMo AI*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
