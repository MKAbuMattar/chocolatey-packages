$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/musistudio/claude-code-router/releases/download/v3.1.2/Claude-Code-Router_3.1.2.exe'
  checksum64     = '8fa3631e5972c329c98b0046abcd8ba6443a3617f539f86e67a6a65ab0ce1f94'
  checksumType64 = 'sha256'
  softwareName   = 'Claude Code Router*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
