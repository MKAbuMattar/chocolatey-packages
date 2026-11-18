$ErrorActionPreference = 'Stop'

# electron-builder NSIS; /S installs per user, into the account running choco.
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://downloads.cursor.com/grokbot/stable/win32-x64/1.2.3/Grok_Bot_1.2.3_Setup.exe'
  checksum64     = '85b9e8d10b9ede921b315bb5a1b52db7e0f3438d162aacedfc388c778217765b'
  checksumType64 = 'sha256'
  softwareName   = 'Grok Bot*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
