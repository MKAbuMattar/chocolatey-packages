$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/inkeep/open-knowledge/releases/download/v0.79.14/OpenKnowledge-Setup-x64.exe'
  checksum64     = 'e8f2e37e6d74f82e7b1d2860fc38a127ff58b8343dd9c6e621b8c94e097fc84c'
  checksumType64 = 'sha256'
  softwareName   = 'OpenKnowledge*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
