$ErrorActionPreference = 'Stop'

# A Squirrel installer: it installs per user, into the account running choco, and
# --silent keeps it from opening any window.
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://downloads.factory.ai/factory-desktop/releases/1.10.0/win32/x64/Factory-1.10.0%20Setup.exe'
  checksum64     = '58c535bbc09b1d7b84bfa40b4776e9c8e0abea97a3f775b981f921d0cc2d40f1'
  checksumType64 = 'sha256'
  softwareName   = 'Factory'
  silentArgs     = '--silent'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
