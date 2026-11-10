$ErrorActionPreference = 'Stop'

# Per-user MSI: it installs to %LOCALAPPDATA%\Programs\ArtCraft\Launcher and has no
# all-users mode, so unlike the other Craft packages it gets no ALLUSERS=1.
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'MSI'
  url64          = 'https://github.com/storytold/craft-launcher/releases/download/v0.18.0/artcraft-launcher-0.18.0-windows-x64.msi'
  checksum64     = '6383b4b1c38c94316fc94d2dd0819a5cc9b2c939e3eb7adad84e0b0aabba41ba'
  checksumType64 = 'sha256'
  softwareName   = 'ArtCraft Launcher*'
  silentArgs     = '/qn /norestart'
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
