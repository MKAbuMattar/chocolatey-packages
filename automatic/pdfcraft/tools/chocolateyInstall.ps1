$ErrorActionPreference = 'Stop'

# A per-machine install, so Chocolatey's auto-uninstaller finds it by product name.
# The Craft MSIs became dual-mode and install per user unless told ALLUSERS=1, which
# fails with 1603 beside an earlier per-machine copy.
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'MSI'
  url64          = 'https://github.com/storytold/pdfcraft/releases/download/v0.19.0/pdfcraft-0.19.0-windows-x64.msi'
  checksum64     = '53a6e25d181d636134f156a0a57b33f781976bf1c7e2af04296df1aa41db9fee'
  checksumType64 = 'sha256'
  softwareName   = 'PdfCraft*'
  silentArgs     = '/qn /norestart ALLUSERS=1'
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
