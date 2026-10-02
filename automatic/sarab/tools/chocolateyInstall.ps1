$ErrorActionPreference = 'Stop'

# A Tauri NSIS installer, so /S. It installs per user, into the account running choco.
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/MKAbuMattar/sarab/releases/download/v0.0.3/Sarab_0.0.3_x64-setup.exe'
  checksum64     = '77a9c2163fb0feb6b244d3373c31cbb3c281e80c0824d9c157980889ab8749d7'
  checksumType64 = 'sha256'
  softwareName   = 'Sarab*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
