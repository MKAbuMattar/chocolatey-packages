$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/Mintplex-Labs/anything-llm/releases/download/v1.18.0/AnythingLLMDesktop.exe'
  checksum64     = 'b572dc48fbf6967bd3d7a408468fbdb7aa3adbc75d90fc52421385fd1a799e5e'
  checksumType64 = 'sha256'
  softwareName   = 'AnythingLLM*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
