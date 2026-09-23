$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/QwenAudio/qwen-audio-agent/releases/download/v2.0.0/qwen-audio-agent-2.0.0-win-x64.exe'
  checksum64     = '074f3b28fc493fa36269f45409053a5807355e7b0f3cbc3816373c1195bf3921'
  checksumType64 = 'sha256'
  softwareName   = 'Qwen Audio Agent*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
