$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/OpenAEC-Foundation/open-pdf-studio/releases/download/v2026.44.0/Open.PDF.Studio_2026.44.0_x64-setup.exe'
  checksum64     = '375579deae971654bfa782182f1da0e374c90010f1bbf4ff527e7174b5759cac'
  checksumType64 = 'sha256'
  softwareName   = 'Open PDF Studio*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
