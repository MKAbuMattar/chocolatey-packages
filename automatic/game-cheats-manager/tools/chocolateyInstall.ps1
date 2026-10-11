$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/dyang886/Game-Cheats-Manager/releases/download/v2.5.4/Game.Cheats.Manager.Setup.2.5.4.exe'
  checksum64     = '35290a3dd3dfc8c05cd7a4feb842c31cf87b0abaa1092fbb8deab4a15347dce5'
  checksumType64 = 'sha256'
  softwareName   = 'Game Cheats Manager*'
  silentArgs     = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
