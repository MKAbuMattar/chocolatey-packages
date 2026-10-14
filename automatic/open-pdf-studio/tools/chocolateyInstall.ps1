$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/OpenAEC-Foundation/open-pdf-studio/releases/download/v2026.42.4/Open.PDF.Studio_2026.42.4_x64-setup.exe'
  checksum64     = '6d68147fba32cf3808d4dfcb6ff545ffa04cd65a9f72f03f8813461bb0fca782'
  checksumType64 = 'sha256'
  softwareName   = 'Open PDF Studio*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
