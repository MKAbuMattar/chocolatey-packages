$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://mimocode-cdn.xiaomimimo.com/mimocode/mimodesktopai/XiaomiMiMo-AI-26.1110.100859-x64-setup.exe'
  checksum64     = '8eee95f7c40337d586177c937c97e8f68bfbed73244571610d0f01f97ad29560'
  checksumType64 = 'sha256'
  softwareName   = 'Xiaomi MiMo AI*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
