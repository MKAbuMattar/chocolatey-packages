$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/inkeep/open-knowledge/releases/download/v0.77.7/OpenKnowledge-Setup-x64.exe'
  checksum64     = '76f1b83bbdeacfb1cd67da4079e29dc65ae46e4bfb15f903dd2122aa7144961c'
  checksumType64 = 'sha256'
  softwareName   = 'OpenKnowledge*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
