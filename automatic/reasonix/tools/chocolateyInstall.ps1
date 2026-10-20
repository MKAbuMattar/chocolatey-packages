$ErrorActionPreference = 'Stop'

# An NSIS installer, so /S; softwareName matches the product name it registers.
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/esengine/DeepSeek-Reasonix/releases/download/desktop-v1.39.9/Reasonix-windows-amd64-installer.exe'
  checksum64     = 'dec21d668e758dcd16c93d0bafc9c6e9fbaec105d018643f3c36c23cd442c181'
  checksumType64 = 'sha256'
  softwareName   = 'Reasonix*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
