$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/inkeep/open-knowledge/releases/download/v0.86.18/OpenKnowledge-Setup-x64.exe'
  checksum64     = '4b39c9f455fe4803cfbd88fa5a5ddd9db5bb5b1e67d3e367d892236648a885e5'
  checksumType64 = 'sha256'
  softwareName   = 'OpenKnowledge*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
