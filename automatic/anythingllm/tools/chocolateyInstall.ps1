$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/Mintplex-Labs/anything-llm/releases/download/v1.15.0/AnythingLLMDesktop.exe'
  checksum64     = '11478d5701163e84387550f30497526c88d4a483edee7475f0810529ffa03944'
  checksumType64 = 'sha256'
  softwareName   = 'AnythingLLM*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
