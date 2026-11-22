$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/OrchestratorInc/agent-orchestrator/releases/download/v0.15.4/Agent.Orchestrator.Setup.0.15.4.exe'
  checksum64     = 'f29ea47c2b39d521095e7b67e08bd1e43eb67b3f60e7143e4208902ef9569e65'
  checksumType64 = 'sha256'
  softwareName   = 'Agent Orchestrator*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
