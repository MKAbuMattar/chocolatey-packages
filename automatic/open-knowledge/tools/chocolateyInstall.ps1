$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/inkeep/open-knowledge/releases/download/v0.86.11/OpenKnowledge-Setup-x64.exe'
  checksum64     = 'a0e9c4cba776ad67af47e216e5582f0e6b56a11014ee278c4f1630bdfd1f5fa6'
  checksumType64 = 'sha256'
  softwareName   = 'OpenKnowledge*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
