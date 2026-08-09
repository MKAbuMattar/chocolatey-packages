$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/dyang886/Game-Cheats-Manager/releases/download/v2.4.6/Game.Cheats.Manager.Setup.2.4.6.exe'
  checksum64     = 'd6229ec299b001c277327e78256cb7bcc471a5bb90a86fbd6aeebcb76bc6a129'
  checksumType64 = 'sha256'
  softwareName   = 'Game Cheats Manager*'
  silentArgs     = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
