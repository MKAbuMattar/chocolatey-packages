$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/OpenAEC-Foundation/open-pdf-studio/releases/download/v2.0.1/Open.PDF.Studio_2.0.1_x64-setup.exe'
  checksum64     = 'e3fae01c785ebfe7a707fdc3c7847252ec49daa6583632a05c8a77446f881959'
  checksumType64 = 'sha256'
  softwareName   = 'Open PDF Studio*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
