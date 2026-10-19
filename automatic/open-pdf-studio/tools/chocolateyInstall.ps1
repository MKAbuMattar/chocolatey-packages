$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/OpenAEC-Foundation/open-pdf-studio/releases/download/v2026.42.13/Open.PDF.Studio_2026.42.13_x64-setup.exe'
  checksum64     = '075df76889203bfaafb8a860c2593599d41d0c8ad0dd062dee63d61e8423dcbc'
  checksumType64 = 'sha256'
  softwareName   = 'Open PDF Studio*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
