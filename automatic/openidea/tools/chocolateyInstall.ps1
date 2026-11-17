$ErrorActionPreference = 'Stop'

# The Tauri MSI rather than the NSIS setup.exe: it installs per machine, so Chocolatey's
# auto-uninstaller finds it by product name.
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'MSI'
  url64          = 'https://github.com/l0ng-ai/openidea/releases/download/v0.1.47/OpenIDEA_0.1.47_x64_en-US.msi'
  checksum64     = 'e3a11b94ac611f07ab174ecfb59ac7910fa1b009cb5d868150856e8494b0ba3f'
  checksumType64 = 'sha256'
  softwareName   = 'OpenIDEA*'
  silentArgs     = '/qn /norestart'
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
