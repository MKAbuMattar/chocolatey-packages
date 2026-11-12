$ErrorActionPreference = 'Stop'

# A per-machine install, so Chocolatey's auto-uninstaller finds it by product name.
# The Craft MSIs became dual-mode and install per user unless told ALLUSERS=1, which
# fails with 1603 beside an earlier per-machine copy.
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'MSI'
  url64          = 'https://github.com/storytold/figcraft/releases/download/v0.18.0/figcraft-0.18.0-windows-x64.msi'
  checksum64     = '2cace2cd43a4a0eba989525045a4dfe6077faebfa354dce235a7c0a461993053'
  checksumType64 = 'sha256'
  softwareName   = 'FigCraft*'
  silentArgs     = '/qn /norestart ALLUSERS=1'
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
