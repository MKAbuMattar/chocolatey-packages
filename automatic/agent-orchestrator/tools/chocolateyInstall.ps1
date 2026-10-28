$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/OrchestratorInc/agent-orchestrator/releases/download/v0.14.7/Agent.Orchestrator.Setup.0.14.7.exe'
  checksum64     = 'f07d812a9199ee5bcbe4d9d48d61cf34ebf85b857b2abc169d81ad1d04fc3179'
  checksumType64 = 'sha256'
  softwareName   = 'Agent Orchestrator*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
