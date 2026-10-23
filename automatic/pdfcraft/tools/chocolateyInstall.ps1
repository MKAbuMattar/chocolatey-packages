$ErrorActionPreference = 'Stop'

# A per-machine MSI (ALLUSERS=1), so Chocolatey's auto-uninstaller finds it by product name.
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'MSI'
  url64          = 'https://github.com/storytold/pdfcraft/releases/download/v0.13.0/pdfcraft-0.13.0-windows-x64.msi'
  checksum64     = 'a6ef64b4106ccf084b5d185fb01c290d28af00f42a0b93fa53df0e0ce6f4600a'
  checksumType64 = 'sha256'
  softwareName   = 'PdfCraft*'
  silentArgs     = '/qn /norestart'
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
