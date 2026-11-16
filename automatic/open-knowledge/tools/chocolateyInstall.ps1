$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/inkeep/open-knowledge/releases/download/v0.89.7/OpenKnowledge-Setup-x64.exe'
  checksum64     = '2da38fbcb8c21b729057c5cfeb5e1b1e9d4d5ea437d0631f5a23089d379ef95f'
  checksumType64 = 'sha256'
  softwareName   = 'OpenKnowledge*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
