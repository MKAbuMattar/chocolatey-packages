$ErrorActionPreference = 'Stop'

# Per-user MSI: it installs to %LOCALAPPDATA%\Programs\ArtCraft\Launcher and has no
# all-users mode, so unlike the other Craft packages it gets no ALLUSERS=1.
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'MSI'
  url64          = 'https://github.com/storytold/craft-launcher/releases/download/v0.15.0/artcraft-launcher-0.15.0-windows-x64.msi'
  checksum64     = '2574c369dfe0b3a3d49dd1f030c4e45e401ea589454fb10288ddd897a11a119b'
  checksumType64 = 'sha256'
  softwareName   = 'ArtCraft Launcher*'
  silentArgs     = '/qn /norestart'
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
