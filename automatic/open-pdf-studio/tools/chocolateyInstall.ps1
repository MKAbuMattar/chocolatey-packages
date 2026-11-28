$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/OpenAEC-Foundation/open-pdf-studio/releases/download/v2026.48.30/Open.PDF.Studio_2026.48.30_x64-setup.exe'
  checksum64     = '21bc3aa49f9f05402b1cb3a23effcd25f4e601479837831767529c81e2b2ffd1'
  checksumType64 = 'sha256'
  softwareName   = 'Open PDF Studio*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
