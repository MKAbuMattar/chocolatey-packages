$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/OpenAEC-Foundation/open-pdf-studio/releases/download/v2026.46.0/Open.PDF.Studio_2026.46.0_x64-setup.exe'
  checksum64     = '7856630a4cdb02709c29b4564067ae32f0571d80d6e21fd95c7035e57c7778e2'
  checksumType64 = 'sha256'
  softwareName   = 'Open PDF Studio*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
