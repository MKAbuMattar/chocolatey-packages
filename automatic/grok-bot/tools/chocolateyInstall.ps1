$ErrorActionPreference = 'Stop'

# electron-builder NSIS; /S installs per user, into the account running choco.
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://downloads.cursor.com/grokbot/stable/win32-x64/0.79.4/Grok_Bot_0.79.4_Setup.exe'
  checksum64     = '4e9f9a88768e45232093b179eba1e6a1780f8ada1f84a1a012ae0d9f07773605'
  checksumType64 = 'sha256'
  softwareName   = 'Grok Bot*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
