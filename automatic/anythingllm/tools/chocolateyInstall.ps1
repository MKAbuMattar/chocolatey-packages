$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/Mintplex-Labs/anything-llm/releases/download/v1.16.1/AnythingLLMDesktop.exe'
  checksum64     = '8b5d9583abbbb236a5f8f3970b8e9d47e6b167a7707a16c8fe6a655a32c92775'
  checksumType64 = 'sha256'
  softwareName   = 'AnythingLLM*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
