$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/musistudio/claude-code-router/releases/download/v3.1.6/Claude-Code-Router_3.1.6.exe'
  checksum64     = 'cecccf5aed03b56d864f8a6222f1043aeb9a288dcfaa1ce4d564ee9c69a9d33a'
  checksumType64 = 'sha256'
  softwareName   = 'Claude Code Router*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
