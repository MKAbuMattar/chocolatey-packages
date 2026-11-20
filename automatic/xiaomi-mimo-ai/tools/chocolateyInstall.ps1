$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://mimocode-cdn.xiaomimimo.com/mimocode/mimodesktopai/XiaomiMiMo-AI-26.1120.201429-x64-setup.exe'
  checksum64     = '23f2cbc9ad179b0149cbd720b1e76c4515e7e0570e506a13dbeceb393dff4f51'
  checksumType64 = 'sha256'
  softwareName   = 'Xiaomi MiMo AI*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
