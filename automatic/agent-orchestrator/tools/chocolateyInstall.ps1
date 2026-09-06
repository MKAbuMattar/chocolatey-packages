$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/Untrivial-ai/agent-orchestrator/releases/download/v0.12.12/Agent.Orchestrator.Setup.0.12.12.exe'
  checksum64     = 'c6c83f630d69bd0843e967b2cff2cbf841ec4135d8a7a69c6aed83e7bde344a7'
  checksumType64 = 'sha256'
  softwareName   = 'Agent Orchestrator*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
