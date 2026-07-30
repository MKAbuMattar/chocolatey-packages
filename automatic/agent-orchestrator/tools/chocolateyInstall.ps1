$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/AgentWrapper/agent-orchestrator/releases/download/v0.11.1/Agent.Orchestrator.Setup.0.11.1.exe'
  checksum64     = 'e931a394f55fe04a637fef45a3e6de1507acb00b7abe204d7294b4858387ff13'
  checksumType64 = 'sha256'
  softwareName   = 'Agent Orchestrator*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
