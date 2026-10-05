$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/inkeep/open-knowledge/releases/download/v0.82.2/OpenKnowledge-Setup-x64.exe'
  checksum64     = '7a19acd8b49d62d050f3ad1f14f4b9bd2792b8e7e7454046f4d6cfe90004d6c8'
  checksumType64 = 'sha256'
  softwareName   = 'OpenKnowledge*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
