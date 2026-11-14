$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/OrchestratorInc/agent-orchestrator/releases/download/v0.15.1/Agent.Orchestrator.Setup.0.15.1.exe'
  checksum64     = '9ed60328a9dcdfc3774996ce25722fed779f556d4b9ed6d26b9848dc5e44e847'
  checksumType64 = 'sha256'
  softwareName   = 'Agent Orchestrator*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
