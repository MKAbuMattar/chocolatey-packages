$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/QwenAudio/qwen-audio-agent/releases/download/v1.11.0/qwen-audio-agent-1.11.0-win-x64.exe'
  checksum64     = '1fb0bbf6cd79deb39433709403442d139de6e82df4c28e71f0fd7d8c81298a74'
  checksumType64 = 'sha256'
  softwareName   = 'Qwen Audio Agent*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
