$ErrorActionPreference = 'Stop'

# A one-click electron-builder NSIS installer, so /S. It installs per user, into the
# account running choco.
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/tashfeenahmed/freellmapi/releases/download/v0.16.27/FreeLLMAPI-Setup-0.16.27.exe'
  checksum64     = '3ae5f5ab95465e2022a5f828ada7fd4592e2a40114024d63b89599562b097142'
  checksumType64 = 'sha256'
  softwareName   = 'FreeLLMAPI*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
