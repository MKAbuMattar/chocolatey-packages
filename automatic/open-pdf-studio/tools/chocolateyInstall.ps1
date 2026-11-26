$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/OpenAEC-Foundation/open-pdf-studio/releases/download/v2026.48.29/Open.PDF.Studio_2026.48.29_x64-setup.exe'
  checksum64     = 'e24999dde78ae75ccd578782a3ecb9e1bafe1a4d8e3f4c49283e5b8d16f3349e'
  checksumType64 = 'sha256'
  softwareName   = 'Open PDF Studio*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
