$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/OpenAEC-Foundation/open-pdf-studio/releases/download/v2026.46.2/Open.PDF.Studio_2026.46.2_x64-setup.exe'
  checksum64     = '5c2beab849f79867ca55964d29c9dfaf2cf03519b7725d7ba080c7d47be64ebb'
  checksumType64 = 'sha256'
  softwareName   = 'Open PDF Studio*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
