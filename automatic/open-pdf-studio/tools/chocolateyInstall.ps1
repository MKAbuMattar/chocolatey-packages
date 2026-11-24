$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/OpenAEC-Foundation/open-pdf-studio/releases/download/v2026.48.8/Open.PDF.Studio_2026.48.8_x64-setup.exe'
  checksum64     = 'de6e9fbd46efaf997c82c98e5012fc46501ddf2bd3d897c057aba8a83c4e5109'
  checksumType64 = 'sha256'
  softwareName   = 'Open PDF Studio*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
