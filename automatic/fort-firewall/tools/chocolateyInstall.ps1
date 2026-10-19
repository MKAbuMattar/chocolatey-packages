$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/tnodir/fort/releases/download/v3.20.7/FortFirewall-3.20.7-windows10-x86_64.exe'
  checksum64     = '1eb6be3b7c38c987ee7007524bf46b545e94fccc1a6714034fb1dd058e2e86e2'
  checksumType64 = 'sha256'
  softwareName   = 'Fort Firewall*'
  silentArgs     = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
