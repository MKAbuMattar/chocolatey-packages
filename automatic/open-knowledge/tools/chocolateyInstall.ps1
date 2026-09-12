$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/inkeep/open-knowledge/releases/download/v0.71.13/OpenKnowledge-Setup-x64.exe'
  checksum64     = 'f6c81d4b69e26f453b29d1d93223488ec10bcfbd63ff5ced009dc207cf8dc50b'
  checksumType64 = 'sha256'
  softwareName   = 'OpenKnowledge*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
