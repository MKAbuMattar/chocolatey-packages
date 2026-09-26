$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/QwenAudio/qwen-audio-agent/releases/download/v2.0.1/qwen-audio-agent-2.0.1-win-x64.exe'
  checksum64     = '732631a21aff36897751552a2d6c6ab5644623f8efabc6a92e374bb06e0aeb56'
  checksumType64 = 'sha256'
  softwareName   = 'Qwen Audio Agent*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
