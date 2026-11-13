$ErrorActionPreference = 'Stop'

# An NSIS installer, so /S; softwareName matches the product name it registers.
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/CherryHQ/cherry-studio/releases/download/v2.2.2/Cherry-Studio-2.2.2-win-x64-setup.exe'
  checksum64     = '58d7ce69dd7767094c81430c487c35dd604a5103e9803696cc4ac03e9b6642ff'
  checksumType64 = 'sha256'
  softwareName   = 'Cherry Studio*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
