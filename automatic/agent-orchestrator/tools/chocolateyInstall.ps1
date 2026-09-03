$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/Untrivial-ai/agent-orchestrator/releases/download/v0.12.10/Agent.Orchestrator.Setup.0.12.10.exe'
  checksum64     = 'd20adb169e25dc98aeda94f8dabe9c0b9dd9efad14b141cd7a8fe336886a28a5'
  checksumType64 = 'sha256'
  softwareName   = 'Agent Orchestrator*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
