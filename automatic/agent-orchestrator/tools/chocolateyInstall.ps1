$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/Untrivial-ai/agent-orchestrator/releases/download/v0.13.2/Agent.Orchestrator.Setup.0.13.2.exe'
  checksum64     = '34010c1c7fe7f8f50e83ab1c71213cfc1c0985525b764a7129baa3685b9815c4'
  checksumType64 = 'sha256'
  softwareName   = 'Agent Orchestrator*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
