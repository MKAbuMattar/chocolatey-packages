$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/inkeep/open-knowledge/releases/download/v0.89.9/OpenKnowledge-Setup-x64.exe'
  checksum64     = '63cc3682042b25fd6e125100c9bec1ba78e5029cbe3f40fc2e2e6902acf0bf4a'
  checksumType64 = 'sha256'
  softwareName   = 'OpenKnowledge*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
