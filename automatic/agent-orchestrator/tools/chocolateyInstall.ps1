$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/Untrivial-ai/agent-orchestrator/releases/download/v0.13.0/Agent.Orchestrator.Setup.0.13.0.exe'
  checksum64     = '2ee1f0b199087a9fc0938670f778a0db46dd9bc7fe3d702d6ee63ece3da66036'
  checksumType64 = 'sha256'
  softwareName   = 'Agent Orchestrator*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
