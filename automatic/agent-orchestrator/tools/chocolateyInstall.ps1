$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/Untrivial-ai/agent-orchestrator/releases/download/v0.12.11/Agent.Orchestrator.Setup.0.12.11.exe'
  checksum64     = '44e3ab04a8fb83ed0d634c851b0e473eff9be61e1b33c67b2bc0a68f2f42388e'
  checksumType64 = 'sha256'
  softwareName   = 'Agent Orchestrator*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
