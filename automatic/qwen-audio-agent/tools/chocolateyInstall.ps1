$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/QwenAudio/qwen-audio-agent/releases/download/v2.1.0/qwen-audio-agent-2.1.0-win-x64.exe'
  checksum64     = '3572f9177dfdb041985b85c3bd7d55f9c7edff222a3b0664161cf3c69804f5cf'
  checksumType64 = 'sha256'
  softwareName   = 'Qwen Audio Agent*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
