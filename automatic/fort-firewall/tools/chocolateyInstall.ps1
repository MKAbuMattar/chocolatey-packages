$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/tnodir/fort/releases/download/v3.21.2/FortFirewall-3.21.2-windows10-x86_64.exe'
  checksum64     = '4ba3b803de02c7db3f8bd0fdcf5890ed186d23e9ea6d00770353b3d75570c5ff'
  checksumType64 = 'sha256'
  softwareName   = 'Fort Firewall*'
  silentArgs     = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
