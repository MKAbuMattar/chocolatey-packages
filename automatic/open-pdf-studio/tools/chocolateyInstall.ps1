$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/OpenAEC-Foundation/open-pdf-studio/releases/download/v2.4.1/Open.PDF.Studio_2.4.1_x64-setup.exe'
  checksum64     = '4ba25af2e43f6156ad301a4e9ba3e5cc1a87a63e8fa734194720e11eabedbb31'
  checksumType64 = 'sha256'
  softwareName   = 'Open PDF Studio*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
