$ErrorActionPreference = 'Stop'

# Per-user MSI: it installs to %LOCALAPPDATA%\Programs\ArtCraft\Launcher and has no
# all-users mode, so unlike the other Craft packages it gets no ALLUSERS=1.
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'MSI'
  url64          = 'https://github.com/storytold/craft-launcher/releases/download/v0.20.1/artcraft-launcher-0.20.1-windows-x64.msi'
  checksum64     = '9aac523e2150014b9f95703d5f0d5df3fff72d2d1bd99a11b2dc5f77d30c7e47'
  checksumType64 = 'sha256'
  softwareName   = 'ArtCraft Launcher*'
  silentArgs     = '/qn /norestart'
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
