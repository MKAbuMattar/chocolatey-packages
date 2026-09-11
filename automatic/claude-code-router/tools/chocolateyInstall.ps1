$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/musistudio/claude-code-router/releases/download/v3.1.0/Claude-Code-Router_3.1.0.exe'
  checksum64     = 'fafe69d5daa7847135636de5e6fbbcf1cccb0de37948a187e96143aed0118f23'
  checksumType64 = 'sha256'
  softwareName   = 'Claude Code Router*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
