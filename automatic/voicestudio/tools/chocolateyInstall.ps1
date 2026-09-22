$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/debpalash/VoiceStudio/releases/download/v0.5.5/VoiceStudio-Electron-0.5.5-win-x64.exe'
  checksum64     = '3bfbe4bc2fed41cec71fd413a3c4c771680854f99777433b5abc7caca213f675'
  checksumType64 = 'sha256'
  softwareName   = 'VoiceStudio*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
