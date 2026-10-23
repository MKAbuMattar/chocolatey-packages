$ErrorActionPreference = 'Stop'

# A Squirrel installer: it installs per user, into the account running choco, and
# --silent keeps it from opening any window.
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://downloads.factory.ai/factory-desktop/releases/0.205.0/win32/x64/Factory-0.205.0%20Setup.exe'
  checksum64     = 'ec6998c3cd6a788045ac84ed3f6e1e81eccda7e31ead7d24a12e8952b5e69b5b'
  checksumType64 = 'sha256'
  softwareName   = 'Factory'
  silentArgs     = '--silent'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
