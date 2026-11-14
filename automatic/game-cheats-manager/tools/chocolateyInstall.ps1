$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/dyang886/Game-Cheats-Manager/releases/download/v2.5.5/Game.Cheats.Manager.Setup.2.5.5.exe'
  checksum64     = 'bb118a43ff00a6852a366be39eae8504e33c7bfdeff0749e595cb24dcd339d7c'
  checksumType64 = 'sha256'
  softwareName   = 'Game Cheats Manager*'
  silentArgs     = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
