$ErrorActionPreference = 'Stop'

# A custom NSIS installer, so /S. It installs per user, into the account running choco,
# and needs Windows 11. The agent runtime (about 1.3 GB) is not bundled: Nod downloads
# it on first local setup.
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/n8n-io/nod/releases/download/nod-v0.9.2/nod-Setup-x64.exe'
  checksum64     = '3236f594f341e0c4090d19ffadc1c37003932aa8dfc45256b9a6ac300037c72f'
  checksumType64 = 'sha256'
  softwareName   = 'Nod'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
