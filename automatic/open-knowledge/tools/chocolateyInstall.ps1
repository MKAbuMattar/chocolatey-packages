$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/inkeep/open-knowledge/releases/download/v0.49.2/OpenKnowledge-Setup-x64.exe'
  checksum64     = '2fd6e3ae093be1ddb0dc029a6dd88b3c53149b99f3bbbbb9326fde4d9ad5eb30'
  checksumType64 = 'sha256'
  softwareName   = 'OpenKnowledge*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
