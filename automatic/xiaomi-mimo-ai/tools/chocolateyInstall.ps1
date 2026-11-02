$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://mimocode-cdn.xiaomimimo.com/mimocode/mimodesktopai/XiaomiMiMo-AI-26.1102.21158-x64-setup.exe'
  checksum64     = '8edc9d3e27af6185de934f655d6e3da436eb91c97296d8c91d54176625747f65'
  checksumType64 = 'sha256'
  softwareName   = 'Xiaomi MiMo AI*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
