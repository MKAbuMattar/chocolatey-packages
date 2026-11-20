$ErrorActionPreference = 'Stop'

# Inno Setup. It installs per machine when run as administrator, as choco does.
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/ymusic-io/YMusicV4/releases/download/release-v4.0.27/YMusic-4.0.27-windows-x64-setup.exe'
  checksum64     = 'f7c1e7f490e800697d6aeb3ef10d28f3ec555a2bafd94a14284601abf738b0b9'
  checksumType64 = 'sha256'
  softwareName   = 'YMusic*'
  silentArgs     = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
