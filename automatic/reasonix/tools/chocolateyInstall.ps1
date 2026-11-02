$ErrorActionPreference = 'Stop'

# An NSIS installer, so /S; softwareName matches the product name it registers.
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/esengine/DeepSeek-Reasonix/releases/download/desktop-v1.39.11/Reasonix-windows-amd64-installer.exe'
  checksum64     = '91c662c7d8e4ed2f6ddbb1b530bdf70327ca1e9000f61ed48fe2ad88d1f86d63'
  checksumType64 = 'sha256'
  softwareName   = 'Reasonix*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
