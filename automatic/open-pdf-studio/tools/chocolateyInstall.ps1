$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/OpenAEC-Foundation/open-pdf-studio/releases/download/v2026.45.0/Open.PDF.Studio_2026.45.0_x64-setup.exe'
  checksum64     = '2748f8f67f5bc7500bf23146e3d31e31e6612b26ff7774b3db5d3dfe7777a8ad'
  checksumType64 = 'sha256'
  softwareName   = 'Open PDF Studio*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
