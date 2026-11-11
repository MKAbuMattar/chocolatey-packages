$ErrorActionPreference = 'Stop'

# The Tauri MSI rather than the NSIS setup.exe: it installs per machine, so Chocolatey's
# auto-uninstaller finds it by product name.
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'MSI'
  url64          = 'https://github.com/l0ng-ai/openidea/releases/download/v0.1.41/OpenIDEA_0.1.41_x64_en-US.msi'
  checksum64     = '1f0e5292c303cdcbe327a7198518951892b2a4f0905858426a8e62415412f0a0'
  checksumType64 = 'sha256'
  softwareName   = 'OpenIDEA*'
  silentArgs     = '/qn /norestart'
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
