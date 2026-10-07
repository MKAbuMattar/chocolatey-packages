$ErrorActionPreference = 'Stop'

# An NSIS installer, so /S; softwareName matches the product name it registers.
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/esengine/DeepSeek-Reasonix/releases/download/desktop-v1.39.8/Reasonix-windows-amd64-installer.exe'
  checksum64     = 'c94a419b2f9d2edb85c1c2e948f6ff65bca27e5dbb2ef3f5d87ac399742a4cc7'
  checksumType64 = 'sha256'
  softwareName   = 'Reasonix*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
