$ErrorActionPreference = 'Stop'

# electron-builder NSIS; /S installs per user, into the account running choco.
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://downloads.cursor.com/grokbot/stable/win32-x64/1.3.0/Grok_Bot_1.3.0_Setup.exe'
  checksum64     = '0a141fff67a43684e3a70469eb6d5b0455c40241eae34858d065061e7011f1b7'
  checksumType64 = 'sha256'
  softwareName   = 'Grok Bot*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
