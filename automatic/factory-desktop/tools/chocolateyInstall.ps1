$ErrorActionPreference = 'Stop'

# A Squirrel installer: it installs per user, into the account running choco, and
# --silent keeps it from opening any window.
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://downloads.factory.ai/factory-desktop/releases/1.6.1/win32/x64/Factory-1.6.1%20Setup.exe'
  checksum64     = '27aafc44b7e62c72875c3fb701a3d6adf40133d989c46ef6e16f24c909fa073e'
  checksumType64 = 'sha256'
  softwareName   = 'Factory'
  silentArgs     = '--silent'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
