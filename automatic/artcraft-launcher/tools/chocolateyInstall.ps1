$ErrorActionPreference = 'Stop'

# Per-user MSI: it installs to %LOCALAPPDATA%\Programs\ArtCraft\Launcher and has no
# all-users mode, so unlike the other Craft packages it gets no ALLUSERS=1.
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'MSI'
  url64          = 'https://github.com/storytold/craft-launcher/releases/download/v0.17.0/artcraft-launcher-0.17.0-windows-x64.msi'
  checksum64     = 'aa96c6c207d5a176899947c74566b8512471fc90b1bc8e287b1c9b7b209ff1be'
  checksumType64 = 'sha256'
  softwareName   = 'ArtCraft Launcher*'
  silentArgs     = '/qn /norestart'
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
