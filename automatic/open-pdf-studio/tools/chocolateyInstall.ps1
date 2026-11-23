$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/OpenAEC-Foundation/open-pdf-studio/releases/download/v2026.48.3/Open.PDF.Studio_2026.48.3_x64-setup.exe'
  checksum64     = '5f6ef97186f349657ebad7a76bd2ec2ea312ac5a88da81e0a557cf7ac00a4af1'
  checksumType64 = 'sha256'
  softwareName   = 'Open PDF Studio*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
