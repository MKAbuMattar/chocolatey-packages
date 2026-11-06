$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/OrchestratorInc/agent-orchestrator/releases/download/v0.14.10/Agent.Orchestrator.Setup.0.14.10.exe'
  checksum64     = 'dab0b4ddf3ae60243c3f3c8f6f121a9c31b94f57055ecaf3a4c66f93eb788fdf'
  checksumType64 = 'sha256'
  softwareName   = 'Agent Orchestrator*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
