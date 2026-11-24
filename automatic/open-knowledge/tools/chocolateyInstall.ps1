$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/inkeep/open-knowledge/releases/download/v0.89.16/OpenKnowledge-Setup-x64.exe'
  checksum64     = 'be5f0d49d79ea5edef9f7095cf1f518bb293ed78b4b1b6018bc35a8c44cc5ee8'
  checksumType64 = 'sha256'
  softwareName   = 'OpenKnowledge*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
