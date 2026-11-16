$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/musistudio/claude-code-router/releases/download/v3.1.5/Claude-Code-Router_3.1.5.exe'
  checksum64     = 'b0be6a7be9283a41c3983922c58167d5935fc1a30a8f8fbaf5beeb3a7cadeaad'
  checksumType64 = 'sha256'
  softwareName   = 'Claude Code Router*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
