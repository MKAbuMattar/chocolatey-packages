$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/OpenAEC-Foundation/open-pdf-studio/releases/download/v2026.44.4/Open.PDF.Studio_2026.44.4_x64-setup.exe'
  checksum64     = '74bde52cf33772b5aef7b1a13ac1f7c285198b3348e4ed899aae0e6652230554'
  checksumType64 = 'sha256'
  softwareName   = 'Open PDF Studio*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
