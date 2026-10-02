$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/zai-org/ZCode/releases/download/v3.14.3/ZCode-3.14.3-win-x64.exe'
  checksum64     = '815721ad9888b03da2bba101faba7368896123849a6a82e3bc9e5fe5f3e5048b'
  checksumType64 = 'sha256'
  softwareName   = 'ZCode*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
