$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/OpenAEC-Foundation/open-pdf-studio/releases/download/v2026.44.5/Open.PDF.Studio_2026.44.5_x64-setup.exe'
  checksum64     = '51201af7f7890bc2fd3668479b89d00989888c8f02ea84b043b6e2ceb1c0d5a8'
  checksumType64 = 'sha256'
  softwareName   = 'Open PDF Studio*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
