$ErrorActionPreference = 'Stop'

# A Tauri NSIS installer, so /S. It installs per user, into the account running choco.
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/MKAbuMattar/sarab/releases/download/v0.0.12/Sarab_0.0.12_x64-setup.exe'
  checksum64     = '7d6a254990a3adf14c1c690cb701cfab1f03699473800f7549811632157b08f4'
  checksumType64 = 'sha256'
  softwareName   = 'Sarab*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
