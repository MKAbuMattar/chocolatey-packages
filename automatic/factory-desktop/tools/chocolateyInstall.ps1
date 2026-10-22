$ErrorActionPreference = 'Stop'

# A Squirrel installer: it installs per user, into the account running choco, and
# --silent keeps it from opening any window.
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://downloads.factory.ai/factory-desktop/releases/0.204.0/win32/x64/Factory-0.204.0%20Setup.exe'
  checksum64     = 'd6e0a4b38acccc81a7dc77d136a5713b9b9c3844671601468f812d55f66f0d84'
  checksumType64 = 'sha256'
  softwareName   = 'Factory'
  silentArgs     = '--silent'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
