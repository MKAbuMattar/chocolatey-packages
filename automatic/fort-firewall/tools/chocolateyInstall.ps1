$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/tnodir/fort/releases/download/v3.20.0/FortFirewall-3.20.0-windows10-x86_64.exe'
  checksum64     = 'bf364b971d5dddddd3a92ab5e89f760fbc425d43c20548603135aef2830b2645'
  checksumType64 = 'sha256'
  softwareName   = 'Fort Firewall*'
  silentArgs     = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
