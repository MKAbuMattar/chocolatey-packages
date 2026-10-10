$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/OrchestratorInc/agent-orchestrator/releases/download/v0.13.7/Agent.Orchestrator.Setup.0.13.7.exe'
  checksum64     = '801d0e5fa80c1392ea6f092c9a230ef88e078e44a537e95943eb8c53b35e54d0'
  checksumType64 = 'sha256'
  softwareName   = 'Agent Orchestrator*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
