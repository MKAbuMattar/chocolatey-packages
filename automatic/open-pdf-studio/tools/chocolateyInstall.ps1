$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/OpenAEC-Foundation/open-pdf-studio/releases/download/v2026.46.3/Open.PDF.Studio_2026.46.3_x64-setup.exe'
  checksum64     = 'c8cf17301fb7965d7c51eadb4a126466865526d2d45398d7b7e3d67dc97210ef'
  checksumType64 = 'sha256'
  softwareName   = 'Open PDF Studio*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
