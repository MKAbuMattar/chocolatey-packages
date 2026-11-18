$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/OpenAEC-Foundation/open-pdf-studio/releases/download/v2026.47.1/Open.PDF.Studio_2026.47.1_x64-setup.exe'
  checksum64     = 'abfa7289e9c342a0c8d6ea6ff201021f0adea2d1bbee21eb7562788aab858ecb'
  checksumType64 = 'sha256'
  softwareName   = 'Open PDF Studio*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
