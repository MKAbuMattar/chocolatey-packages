$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/inkeep/open-knowledge/releases/download/v0.79.3/OpenKnowledge-Setup-x64.exe'
  checksum64     = '00bc9e47a465f79a731d9a00f6720e30a7c90511bff51fd074e49efe9b183661'
  checksumType64 = 'sha256'
  softwareName   = 'OpenKnowledge*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
