$ErrorActionPreference = 'Stop'

# A Tauri NSIS installer, so /S. It installs per user, into the account running choco.
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/MKAbuMattar/sarab/releases/download/v0.0.6/Sarab_0.0.6_x64-setup.exe'
  checksum64     = '8247ae126334ef3a7da899350759339d88f047828cf2a139e075fa9f668e7608'
  checksumType64 = 'sha256'
  softwareName   = 'Sarab*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
