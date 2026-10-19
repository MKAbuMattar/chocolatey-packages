$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/OrchestratorInc/agent-orchestrator/releases/download/v0.14.3/Agent.Orchestrator.Setup.0.14.3.exe'
  checksum64     = 'eb8dea6992cca4e14e47a85f758aada1098d0f503eab6387348140e120598b0e'
  checksumType64 = 'sha256'
  softwareName   = 'Agent Orchestrator*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
