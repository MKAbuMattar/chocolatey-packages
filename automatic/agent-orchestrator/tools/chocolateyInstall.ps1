$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/OrchestratorInc/agent-orchestrator/releases/download/v0.13.5/Agent.Orchestrator.Setup.0.13.5.exe'
  checksum64     = 'dee83f6946d8e314cd1c8755fdfe3bfd9dd4a80315aab7eaa0a631b127526562'
  checksumType64 = 'sha256'
  softwareName   = 'Agent Orchestrator*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
