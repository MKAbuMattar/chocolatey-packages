$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/inkeep/open-knowledge/releases/download/v0.87.2/OpenKnowledge-Setup-x64.exe'
  checksum64     = '7eb50ccdbea23e5965fcb1f0f2b9bfb90febb80f55f535ee470f0f2a7867e2c3'
  checksumType64 = 'sha256'
  softwareName   = 'OpenKnowledge*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
