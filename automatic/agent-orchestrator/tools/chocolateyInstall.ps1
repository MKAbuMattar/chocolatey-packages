$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/OrchestratorInc/agent-orchestrator/releases/download/v0.14.2/Agent.Orchestrator.Setup.0.14.2.exe'
  checksum64     = '2b57b9da8b5f2e3bafbcf1c91548a1ee5eab8ad1797d6c7f556187a2c602b879'
  checksumType64 = 'sha256'
  softwareName   = 'Agent Orchestrator*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
