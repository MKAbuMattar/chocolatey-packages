$ErrorActionPreference = 'Stop'

# The Tauri MSI rather than the NSIS setup.exe: it installs per machine, so Chocolatey's
# auto-uninstaller finds it by product name.
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'MSI'
  url64          = 'https://github.com/l0ng-ai/openidea/releases/download/v0.1.42/OpenIDEA_0.1.42_x64_en-US.msi'
  checksum64     = 'ec85fb70c46a95e3ffa436f210b7a7907335af1bd57503e9c48c7955c21057b5'
  checksumType64 = 'sha256'
  softwareName   = 'OpenIDEA*'
  silentArgs     = '/qn /norestart'
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
