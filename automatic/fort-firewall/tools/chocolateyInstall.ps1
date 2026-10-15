$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/tnodir/fort/releases/download/v3.20.5/FortFirewall-3.20.5-windows10-x86_64.exe'
  checksum64     = 'b3563d5c4dcd2123c822eb2556681a2415cf5295e66f247ef90f7cab02937176'
  checksumType64 = 'sha256'
  softwareName   = 'Fort Firewall*'
  silentArgs     = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
