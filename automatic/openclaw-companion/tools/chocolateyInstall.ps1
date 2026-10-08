$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/openclaw/openclaw/releases/download/v2026.9.9/OpenClawCompanion-Setup-x64.exe'
  checksum64     = '068c059da30dc7602f4abed00c5789ae3207bd27d15b350ca2e3256dd8af274d'
  checksumType64 = 'sha256'
  softwareName   = 'OpenClaw*'
  silentArgs     = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
