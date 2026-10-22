$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/inkeep/open-knowledge/releases/download/v0.87.9/OpenKnowledge-Setup-x64.exe'
  checksum64     = 'b3915c1a2f4c3f972849dda6d80f272bbc2fd3a1a630ff7f95c1a4a11cdcea81'
  checksumType64 = 'sha256'
  softwareName   = 'OpenKnowledge*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
