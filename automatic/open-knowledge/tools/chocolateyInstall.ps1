$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/inkeep/open-knowledge/releases/download/v0.87.5/OpenKnowledge-Setup-x64.exe'
  checksum64     = '33c98c7bdfa7ffa12a59e3d59a5480e67d49c7c541324890260afa5ea3c2d7d5'
  checksumType64 = 'sha256'
  softwareName   = 'OpenKnowledge*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
