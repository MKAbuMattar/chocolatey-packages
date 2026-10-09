$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/musistudio/claude-code-router/releases/download/v3.1.3/Claude-Code-Router_3.1.3.exe'
  checksum64     = '99b4114d8f3b1c089099f8e1faa57c4600ba1b99e158c3968a1d784219b6d689'
  checksumType64 = 'sha256'
  softwareName   = 'Claude Code Router*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
