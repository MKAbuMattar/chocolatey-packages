$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/dyang886/Game-Cheats-Manager/releases/download/v2.5.0/Game.Cheats.Manager.Setup.2.5.0.exe'
  checksum64     = 'efa6ac43337f29b39e1a23aa722746237db0e8a1253715d9ec42c84f5e2b46aa'
  checksumType64 = 'sha256'
  softwareName   = 'Game Cheats Manager*'
  silentArgs     = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
