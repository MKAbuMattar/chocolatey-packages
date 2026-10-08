$ErrorActionPreference = 'Stop'

# A per-machine MSI (ALLUSERS=1), so Chocolatey's auto-uninstaller finds it by product name.
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'MSI'
  url64          = 'https://github.com/storytold/pdfcraft/releases/download/v0.4.0/pdfcraft-0.4.0-windows-x64.msi'
  checksum64     = '76e61e2791cab97273c0d900dc95411c1114699386e9c381a07e5fe31a643e3a'
  checksumType64 = 'sha256'
  softwareName   = 'PdfCraft*'
  silentArgs     = '/qn /norestart'
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
