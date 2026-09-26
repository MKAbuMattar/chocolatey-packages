$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/Untrivial-ai/agent-orchestrator/releases/download/v0.13.1/Agent.Orchestrator.Setup.0.13.1.exe'
  checksum64     = '38cdb98c43dfc36af1c7d0ac57fdeb0c3848c655a17bafbf0b13eda40bfb8382'
  checksumType64 = 'sha256'
  softwareName   = 'Agent Orchestrator*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
