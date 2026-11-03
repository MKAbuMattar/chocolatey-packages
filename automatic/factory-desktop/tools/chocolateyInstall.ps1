$ErrorActionPreference = 'Stop'

# A Squirrel installer: it installs per user, into the account running choco, and
# --silent keeps it from opening any window.
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://downloads.factory.ai/factory-desktop/releases/1.2.0/win32/x64/Factory-1.2.0%20Setup.exe'
  checksum64     = 'b4c9d9b620fe73866a3ccda5ff72b9cbfb2d49b7660b237294b0b287254bdc20'
  checksumType64 = 'sha256'
  softwareName   = 'Factory'
  silentArgs     = '--silent'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
