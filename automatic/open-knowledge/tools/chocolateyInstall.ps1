$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/inkeep/open-knowledge/releases/download/v0.79.13/OpenKnowledge-Setup-x64.exe'
  checksum64     = 'e3c70daf5098d0ac0fe4d76889036ae3f21ebeca3d3f4c46f79d958d1e4c0016'
  checksumType64 = 'sha256'
  softwareName   = 'OpenKnowledge*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
