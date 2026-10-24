$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/tnodir/fort/releases/download/v3.20.8/FortFirewall-3.20.8-windows10-x86_64.exe'
  checksum64     = 'fecdde87e2747e8928b6b831d91a4c7e04310f18869dc64e4b546b6ec9b23b81'
  checksumType64 = 'sha256'
  softwareName   = 'Fort Firewall*'
  silentArgs     = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
