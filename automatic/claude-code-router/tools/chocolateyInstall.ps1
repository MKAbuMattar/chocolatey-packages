$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/musistudio/claude-code-router/releases/download/v3.0.22/Claude-Code-Router_3.0.22.exe'
  checksum64     = '4e4b6c2a52d3459ea86ec7009299b826ecf723f23c0b448c3f9dab99537c7a15'
  checksumType64 = 'sha256'
  softwareName   = 'Claude Code Router*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
