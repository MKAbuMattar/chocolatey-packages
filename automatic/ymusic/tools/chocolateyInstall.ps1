$ErrorActionPreference = 'Stop'

# Inno Setup. It installs per machine when run as administrator, as choco does.
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/ymusic-io/YMusicV4/releases/download/release-v4.0.26/YMusic-4.0.26-windows-x64-setup.exe'
  checksum64     = 'ebac24b87a3e1dc683a6e1a6f54114d5799645a878116f89aead0ad2dd81d718'
  checksumType64 = 'sha256'
  softwareName   = 'YMusic*'
  silentArgs     = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
