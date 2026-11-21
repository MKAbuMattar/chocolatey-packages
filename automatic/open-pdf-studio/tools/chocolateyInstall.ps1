$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/OpenAEC-Foundation/open-pdf-studio/releases/download/v2026.48.2/Open.PDF.Studio_2026.48.2_x64-setup.exe'
  checksum64     = '73a624c0ae036230f1aff7cdfab14545dc7a86a917bb0fb645581a55f13f02a8'
  checksumType64 = 'sha256'
  softwareName   = 'Open PDF Studio*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
