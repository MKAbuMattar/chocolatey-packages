$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/debpalash/VoiceStudio/releases/download/v0.5.6/VoiceStudio-Electron-0.5.6-win-x64.exe'
  checksum64     = '3d7ac1d6b54e7854ca7fff4dda838e402d1c5d31acc9656b1838432e29a97624'
  checksumType64 = 'sha256'
  softwareName   = 'VoiceStudio*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
