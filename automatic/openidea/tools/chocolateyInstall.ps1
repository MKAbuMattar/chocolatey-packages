$ErrorActionPreference = 'Stop'

# The Tauri MSI rather than the NSIS setup.exe: it installs per machine, so Chocolatey's
# auto-uninstaller finds it by product name.
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'MSI'
  url64          = 'https://github.com/l0ng-ai/openidea/releases/download/v0.1.50/OpenIDEA_0.1.50_x64_en-US.msi'
  checksum64     = '6db70c6879ae098a9e5b0c1c03cd9d404db2ab0f57f1a0b4b15cd054b7efd93d'
  checksumType64 = 'sha256'
  softwareName   = 'OpenIDEA*'
  silentArgs     = '/qn /norestart'
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
