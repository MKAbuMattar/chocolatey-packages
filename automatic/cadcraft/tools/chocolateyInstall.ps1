$ErrorActionPreference = 'Stop'

# A per-machine install, so Chocolatey's auto-uninstaller finds it by product name.
# The Craft MSIs became dual-mode and install per user unless told ALLUSERS=1, which
# fails with 1603 beside an earlier per-machine copy.
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'MSI'
  url64          = 'https://github.com/storytold/cadcraft/releases/download/v0.20.0/cadcraft-0.20.0-windows-x64.msi'
  checksum64     = '14101fe317298afda535bab21cbfbf8e4e62a73f0a75af20f5aebf29bca1b1ea'
  checksumType64 = 'sha256'
  softwareName   = 'CADCraft*'
  silentArgs     = '/qn /norestart ALLUSERS=1'
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
