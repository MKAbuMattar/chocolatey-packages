$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/OpenAEC-Foundation/open-pdf-studio/releases/download/v2026.42.11/Open.PDF.Studio_2026.42.11_x64-setup.exe'
  checksum64     = 'e12b8543493c3928283b88c31a4b71ad0fcdb3ceea4ae6bd5b153334696bbeaa'
  checksumType64 = 'sha256'
  softwareName   = 'Open PDF Studio*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
