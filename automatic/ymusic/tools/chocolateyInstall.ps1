$ErrorActionPreference = 'Stop'

# Inno Setup. It installs per machine when run as administrator, as choco does.
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/ymusic-io/YMusicV4/releases/download/release-v4.0.25/YMusic-4.0.25-windows-x64-setup.exe'
  checksum64     = 'fb3d47f41a08601cb3bb6a19a849ba976ccfea5ccd82e42967420a09ae46d39e'
  checksumType64 = 'sha256'
  softwareName   = 'YMusic*'
  silentArgs     = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
