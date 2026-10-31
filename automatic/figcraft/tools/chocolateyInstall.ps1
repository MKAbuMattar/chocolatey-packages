$ErrorActionPreference = 'Stop'

# A per-machine install, so Chocolatey's auto-uninstaller finds it by product name.
# The Craft MSIs became dual-mode and install per user unless told ALLUSERS=1, which
# fails with 1603 beside an earlier per-machine copy.
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'MSI'
  url64          = 'https://github.com/storytold/figcraft/releases/download/v0.13.1/figcraft-0.13.1-windows-x64.msi'
  checksum64     = 'c9807ae713de0960d4de274b3a16c40837dea364978754e6b123c050b15af424'
  checksumType64 = 'sha256'
  softwareName   = 'FigCraft*'
  silentArgs     = '/qn /norestart ALLUSERS=1'
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
