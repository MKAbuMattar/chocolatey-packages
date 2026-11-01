$ErrorActionPreference = 'Stop'

# A per-machine install, so Chocolatey's auto-uninstaller finds it by product name.
# The Craft MSIs became dual-mode and install per user unless told ALLUSERS=1, which
# fails with 1603 beside an earlier per-machine copy.
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'MSI'
  url64          = 'https://github.com/storytold/figcraft/releases/download/v0.14.0/figcraft-0.14.0-windows-x64.msi'
  checksum64     = '7e7467698038a64f4c1349630917bfcd24b6720ceb9fd1e0f363b5b985d03b11'
  checksumType64 = 'sha256'
  softwareName   = 'FigCraft*'
  silentArgs     = '/qn /norestart ALLUSERS=1'
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
