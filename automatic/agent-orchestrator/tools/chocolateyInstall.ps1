$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/Untrivial-ai/agent-orchestrator/releases/download/v0.13.3/Agent.Orchestrator.Setup.0.13.3.exe'
  checksum64     = '3a9177e228fd8c10262aaf07fef67b3c5d10af16262757bffc60f3687c58ac1c'
  checksumType64 = 'sha256'
  softwareName   = 'Agent Orchestrator*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
