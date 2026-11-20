$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/OpenAEC-Foundation/open-pdf-studio/releases/download/v2026.48.1/Open.PDF.Studio_2026.48.1_x64-setup.exe'
  checksum64     = 'c5c8dc47570dbf01c09a70f77cb016943f5c09b622d2c6c93e33b9b96d2a4b70'
  checksumType64 = 'sha256'
  softwareName   = 'Open PDF Studio*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
