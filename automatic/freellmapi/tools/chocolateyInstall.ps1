$ErrorActionPreference = 'Stop'

# A one-click electron-builder NSIS installer, so /S. It installs per user, into the
# account running choco.
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/tashfeenahmed/freellmapi/releases/download/v0.16.28/FreeLLMAPI-Setup-0.16.28.exe'
  checksum64     = 'e2c3a3de3bf117ff2055393e1a9bfc3918ac0c68598f05f2065a0e689dfb31b4'
  checksumType64 = 'sha256'
  softwareName   = 'FreeLLMAPI*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
