$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/QwenAudio/qwen-audio-agent/releases/download/v1.7.0/qwen-audio-agent-1.7.0-win-x64.exe'
  checksum64     = 'd5d80d865959c1d7c011b24a59fae847a1c97324d4c6093de0713e9f55b15616'
  checksumType64 = 'sha256'
  softwareName   = 'Qwen Audio Agent*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
