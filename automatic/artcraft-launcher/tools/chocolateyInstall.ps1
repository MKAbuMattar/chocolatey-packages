$ErrorActionPreference = 'Stop'

# Per-user MSI: it installs to %LOCALAPPDATA%\Programs\ArtCraft\Launcher and has no
# all-users mode, so unlike the other Craft packages it gets no ALLUSERS=1.
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'MSI'
  url64          = 'https://github.com/storytold/craft-launcher/releases/download/v0.19.0/artcraft-launcher-0.19.0-windows-x64.msi'
  checksum64     = 'ffe30715f8d83c88f66c4938054b436f0603cc169115a6e3b63eaa073022655a'
  checksumType64 = 'sha256'
  softwareName   = 'ArtCraft Launcher*'
  silentArgs     = '/qn /norestart'
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
