$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/OrchestratorInc/agent-orchestrator/releases/download/v0.15.2/Agent.Orchestrator.Setup.0.15.2.exe'
  checksum64     = 'd6ba0f7f6d6746b3ef1d60959c15a714611a6004868d503b22dc4617c93cc3de'
  checksumType64 = 'sha256'
  softwareName   = 'Agent Orchestrator*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
