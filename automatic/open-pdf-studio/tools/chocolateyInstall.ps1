$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/OpenAEC-Foundation/open-pdf-studio/releases/download/v2026.43.4/Open.PDF.Studio_2026.43.4_x64-setup.exe'
  checksum64     = '134c3921f2247ec1ebc97d7cd37a4e1e5a46aa792b122371a63c6c8ef84a2ccf'
  checksumType64 = 'sha256'
  softwareName   = 'Open PDF Studio*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
