$ErrorActionPreference = 'Stop'

# An NSIS installer, so /S; softwareName matches the product name it registers.
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/esengine/DeepSeek-Reasonix/releases/download/desktop-v1.39.10/Reasonix-windows-amd64-installer.exe'
  checksum64     = 'a3c5d85c767d7e9c517f262eb50d852d2b82b5731ed6870d5071f2a62eb4a7fa'
  checksumType64 = 'sha256'
  softwareName   = 'Reasonix*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
