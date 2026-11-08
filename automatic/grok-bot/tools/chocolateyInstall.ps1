$ErrorActionPreference = 'Stop'

# electron-builder NSIS; /S installs per user, into the account running choco.
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://downloads.cursor.com/grokbot/stable/win32-x64/0.79.3/Grok_Bot_0.79.3_Setup.exe'
  checksum64     = '5dede0efa229dfb7d1b6c251edf4a7a19225df6837bccc7e09d1193de5766846'
  checksumType64 = 'sha256'
  softwareName   = 'Grok Bot*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
