$ErrorActionPreference = 'Stop'

# A per-machine MSI (ALLUSERS=1), so Chocolatey's auto-uninstaller finds it by product name.
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'MSI'
  url64          = 'https://github.com/storytold/soundcraft/releases/download/v0.3.0/soundcraft-0.3.0-windows-x64.msi'
  checksum64     = 'cb084ef5efc9be5151fa52d345656ce17ae511776e32f39ed510517dbdb0bdc8'
  checksumType64 = 'sha256'
  softwareName   = 'SoundCraft*'
  silentArgs     = '/qn /norestart'
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
