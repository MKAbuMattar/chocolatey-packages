$ErrorActionPreference = 'Stop'

# electron-builder NSIS; /S installs per user, into the account running choco.
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://downloads.cursor.com/grokbot/stable/win32-x64/1.2.0/Grok_Bot_1.2.0_Setup.exe'
  checksum64     = 'bc991e24f3472bf38f1a7fc76d1a469ab5259fa7b357c6aee7a5bc67715c43b7'
  checksumType64 = 'sha256'
  softwareName   = 'Grok Bot*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
