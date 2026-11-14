$ErrorActionPreference = 'Stop'

# The Tauri MSI rather than the NSIS setup.exe: it installs per machine, so Chocolatey's
# auto-uninstaller finds it by product name.
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'MSI'
  url64          = 'https://github.com/l0ng-ai/openidea/releases/download/v0.1.45/OpenIDEA_0.1.45_x64_en-US.msi'
  checksum64     = '86b10fd86b241ba89daaa1dae9200bdaec0dbfa2d0dca920bc00bc4b70fe6470'
  checksumType64 = 'sha256'
  softwareName   = 'OpenIDEA*'
  silentArgs     = '/qn /norestart'
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
