$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/dyang886/Game-Cheats-Manager/releases/download/v2.5.2/Game.Cheats.Manager.Setup.2.5.2.exe'
  checksum64     = '07ae9da82edb9710438057c9159ff7eec894336fd266a628b17f238cd3719a17'
  checksumType64 = 'sha256'
  softwareName   = 'Game Cheats Manager*'
  silentArgs     = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
