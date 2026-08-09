$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/OpenAEC-Foundation/open-pdf-studio/releases/download/v1.84.0/Open.PDF.Studio_1.84.0_x64-setup.exe'
  checksum64     = 'a98e908e2d380f2559e6199cbe90e34a89235c5dab98272a199668d03f04adec'
  checksumType64 = 'sha256'
  softwareName   = 'Open PDF Studio*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
