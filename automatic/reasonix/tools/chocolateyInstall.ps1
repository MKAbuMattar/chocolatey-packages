$ErrorActionPreference = 'Stop'

# An NSIS installer, so /S; softwareName matches the product name it registers.
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/esengine/DeepSeek-Reasonix/releases/download/desktop-v1.39.7/Reasonix-windows-amd64-installer.exe'
  checksum64     = 'd056755a15c6e731a11b6f08989ee5b8b268ee7af5479563c0130601c638a240'
  checksumType64 = 'sha256'
  softwareName   = 'Reasonix*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
