$ErrorActionPreference = 'Stop'

# A per-machine MSI (ALLUSERS=1), so Chocolatey's auto-uninstaller finds it by product name.
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'MSI'
  url64          = 'https://github.com/storytold/pdfcraft/releases/download/v0.6.0/pdfcraft-0.6.0-windows-x64.msi'
  checksum64     = '528b2fec067ea907894d67c7c686d8023aa943a32941a5586ee402070af458b3'
  checksumType64 = 'sha256'
  softwareName   = 'PdfCraft*'
  silentArgs     = '/qn /norestart'
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
