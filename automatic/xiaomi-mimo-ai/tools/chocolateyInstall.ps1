$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://mimocode-cdn.xiaomimimo.com/mimocode/mimodesktopai/XiaomiMiMo-AI-26.1116.161705-x64-setup.exe'
  checksum64     = '5f6ee1ce060bce180c17fcea5e3d0b463b388e42da358a22064c618a5e0c7005'
  checksumType64 = 'sha256'
  softwareName   = 'Xiaomi MiMo AI*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
