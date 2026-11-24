$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/OpenAEC-Foundation/open-pdf-studio/releases/download/v2026.48.7/Open.PDF.Studio_2026.48.7_x64-setup.exe'
  checksum64     = '2e894b37f6ccf5487874b75a95b52b5b205b3b0d69ab3e0e6a745d9382f6fed4'
  checksumType64 = 'sha256'
  softwareName   = 'Open PDF Studio*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
