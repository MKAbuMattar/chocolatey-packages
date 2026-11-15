$ErrorActionPreference = 'Stop'

# Inno Setup. It installs per machine when run as administrator, as choco does.
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/ymusic-io/YMusicV4/releases/download/release-v4.0.22/YMusic-4.0.22-windows-x64-setup.exe'
  checksum64     = '21030cce3509f255b36706f95d43deea56977a938f850ba5241e34bc90f2727a'
  checksumType64 = 'sha256'
  softwareName   = 'YMusic*'
  silentArgs     = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
