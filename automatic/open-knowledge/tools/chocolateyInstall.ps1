$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/inkeep/open-knowledge/releases/download/v0.88.12/OpenKnowledge-Setup-x64.exe'
  checksum64     = '3c36978ea0165c9580b95bdd17401d2d0beecdb6170bef9bf8adffb11f2f5c2f'
  checksumType64 = 'sha256'
  softwareName   = 'OpenKnowledge*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
