$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/openclaw/openclaw/releases/download/v2026.9.1/OpenClawCompanion-Setup-x64.exe'
  checksum64     = '2e2aef8523fed5c8803f449bc161ade6fe3ba89c12b767d936c3df2388466e25'
  checksumType64 = 'sha256'
  softwareName   = 'OpenClaw*'
  silentArgs     = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
