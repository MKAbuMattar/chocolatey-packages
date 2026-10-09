$ErrorActionPreference = 'Stop'

# A Tauri NSIS installer, so /S. It installs per user, into the account running choco.
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/MKAbuMattar/sarab/releases/download/v0.0.9/Sarab_0.0.9_x64-setup.exe'
  checksum64     = '5647b5497ebc4139c33eb7502a0bf427eb010b1d8654719a1444fcc94ac06283'
  checksumType64 = 'sha256'
  softwareName   = 'Sarab*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
