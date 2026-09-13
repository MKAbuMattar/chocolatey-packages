$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'MSI'
  url64          = 'https://github.com/debpalash/VoiceStudio/releases/download/v0.5.2/VoiceStudio_0.5.2_x64_en-US.msi'
  checksum64     = '6c9772bd7b6fa0395e1406d8a33f092ba842857bf3172de1560afe642f39aed4'
  checksumType64 = 'sha256'
  softwareName   = 'VoiceStudio*'
  silentArgs     = '/qn /norestart'
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
