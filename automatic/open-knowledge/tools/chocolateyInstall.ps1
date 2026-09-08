$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/inkeep/open-knowledge/releases/download/v0.68.26/OpenKnowledge-Setup-x64.exe'
  checksum64     = '454a3c434d4dc59e469ba7d8676de9ff9b5fc0ee08a2f0ab760e100456a9f640'
  checksumType64 = 'sha256'
  softwareName   = 'OpenKnowledge*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
