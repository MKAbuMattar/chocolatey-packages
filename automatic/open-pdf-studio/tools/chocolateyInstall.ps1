$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/OpenAEC-Foundation/open-pdf-studio/releases/download/v2026.44.6/Open.PDF.Studio_2026.44.6_x64-setup.exe'
  checksum64     = 'a342260d066ace98239eec43ca5d39ba44c54c5d527075dc5ac1b3c092acb0a2'
  checksumType64 = 'sha256'
  softwareName   = 'Open PDF Studio*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
