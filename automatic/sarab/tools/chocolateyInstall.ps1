$ErrorActionPreference = 'Stop'

# A Tauri NSIS installer, so /S. It installs per user, into the account running choco.
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/MKAbuMattar/sarab/releases/download/v0.0.10/Sarab_0.0.10_x64-setup.exe'
  checksum64     = '9ccd7cd5bb261035401fc3ab8eaa00befdfcef69d700890b49b2327dde50b9ed'
  checksumType64 = 'sha256'
  softwareName   = 'Sarab*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
