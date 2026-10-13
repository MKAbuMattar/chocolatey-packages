$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/OpenAEC-Foundation/open-pdf-studio/releases/download/v2026.41.0/Open.PDF.Studio_2026.41.0_x64-setup.exe'
  checksum64     = '2c85ed99d97faa3b9f0fbb1fa3edbae1d42deaf126ca48a4f96c3cb33096b1a8'
  checksumType64 = 'sha256'
  softwareName   = 'Open PDF Studio*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
