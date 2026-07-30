$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/openclaw/openclaw/releases/download/v2026.7.1/OpenClawCompanion-Setup-x64.exe'
  checksum64     = 'b5e18b9210d606b921d94cea4e695a56ebae9862038e77e0483b552585d4d42b'
  checksumType64 = 'sha256'
  softwareName   = 'OpenClaw*'
  silentArgs     = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
