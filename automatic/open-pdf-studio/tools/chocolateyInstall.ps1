$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/OpenAEC-Foundation/open-pdf-studio/releases/download/v2026.42.8/Open.PDF.Studio_2026.42.8_x64-setup.exe'
  checksum64     = '969a2244c44d714c607bf6c50fe7eb04a9c34b61ffd1a0411138f8bf05a3ab69'
  checksumType64 = 'sha256'
  softwareName   = 'Open PDF Studio*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
