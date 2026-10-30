$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/OrchestratorInc/agent-orchestrator/releases/download/v0.14.8/Agent.Orchestrator.Setup.0.14.8.exe'
  checksum64     = '85f0b4fb0c504631abca4c45aeca78241dbf4a8c6a4c5ae1baa2a8d7c33d57c6'
  checksumType64 = 'sha256'
  softwareName   = 'Agent Orchestrator*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
